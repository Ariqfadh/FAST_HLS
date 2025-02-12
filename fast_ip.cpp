#include "fast_ip.h"

void fast_ip(
    hls::stream<pixel_axis_t> &src_axi,
    hls::stream<mask_axis_t> &dst_axi,
    int img_width,
    int img_height,
    unsigned char threshold
) {
    // AXI interfaces and control ports
    #pragma HLS INTERFACE axis register both port=src_axi
    #pragma HLS INTERFACE axis register both port=dst_axi
    #pragma HLS INTERFACE s_axilite port=img_width bundle=CONTROL_BUS
    #pragma HLS INTERFACE s_axilite port=img_height bundle=CONTROL_BUS
    #pragma HLS INTERFACE s_axilite port=threshold bundle=CONTROL_BUS
    #pragma HLS INTERFACE s_axilite port=return bundle=CONTROL_BUS

    // Line buffer for neighborhood processing
    static unsigned char line_buf[7][MAX_WIDTH];
    #pragma HLS ARRAY_PARTITION variable=line_buf complete dim=1
    #pragma HLS ARRAY_PARTITION variable=line_buf cyclic factor=16 dim=2

    // Cache for circle pixels (used in FAST detection)
    static unsigned char circle_cache[CIRCLE_SIZE];
    #pragma HLS ARRAY_PARTITION variable=circle_cache complete dim=1

    row_loop: for (int y = 0; y < img_height; y++) {
        #pragma HLS LOOP_FLATTEN off
        col_loop: for (int x = 0; x < img_width; x++) {
            #pragma HLS PIPELINE II=1

            pixel_axis_t tmp = src_axi.read();
            unsigned char pixel_in = (unsigned char)(tmp.data.range(7,0));

            // Shift the line buffer and add new pixel
            for (int i = 0; i < 6; i++) {
                #pragma HLS UNROLL
                line_buf[i][x] = line_buf[i+1][x];
            }
            line_buf[6][x] = pixel_in;

            if (x >= 3 && x < img_width-3 && y >= 3 && y < img_height-3) {
                for (int i = 0; i < CIRCLE_SIZE; i++) {
                    #pragma HLS UNROLL
                    int dx = circle_coords[i][0];
                    int dy = circle_coords[i][1];
                    circle_cache[i] = line_buf[3 + dy][x + dx];
                }
            }

            ap_uint<1> pixel_out = 0;
            if (x >= 3 && x < img_width-3 && y >= 3 && y < img_height-3) {
                unsigned char center = line_buf[3][x];
                unsigned char th_high = center + threshold;
                unsigned char th_low = center - threshold;

                bool brighter[CIRCLE_SIZE], darker[CIRCLE_SIZE];
                #pragma HLS ARRAY_PARTITION variable=brighter complete dim=1
                #pragma HLS ARRAY_PARTITION variable=darker complete dim=1

                for (int i = 0; i < CIRCLE_SIZE; i++) {
                    #pragma HLS UNROLL
                    unsigned char pixel = circle_cache[i];
                    brighter[i] = (pixel > th_high);
                    darker[i]   = (pixel < th_low);
                }

                bool is_corner = false;
                for (int i = 0; i < CIRCLE_SIZE; i++) {
                    #pragma HLS UNROLL
                    bool bright_cont = true;
                    bool dark_cont = true;
                    for (int j = 0; j < 12; j++) {
                        #pragma HLS UNROLL
                        int idx = (i + j) % CIRCLE_SIZE;
                        bright_cont &= brighter[idx];
                        dark_cont   &= darker[idx];
                    }
                    is_corner |= (bright_cont || dark_cont);
                }
                pixel_out = is_corner ? 1 : 0;
            }

            mask_axis_t mask;
            mask.data = pixel_out;
            mask.last = (x == (img_width - 1)) && (y == (img_height - 1));
            mask.keep = 1;
            mask.strb = 1;
            dst_axi.write(mask);
        }
    }
}
