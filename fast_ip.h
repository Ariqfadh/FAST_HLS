#ifndef FAST_IP_H
#define FAST_IP_H

#include <ap_int.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include <stdint.h>

// Maximum image width supported
#define MAX_WIDTH 1920

// Number of pixels in the FAST circle (16 pixels)
#define CIRCLE_SIZE 16

// Circle coordinates for FAST detector (radius = 3)
const int circle_coords[CIRCLE_SIZE][2] = {
    {0, 3}, {1, 3}, {2, 2}, {3, 1},
    {3, 0}, {3, -1}, {2, -2}, {1, -3},
    {0, -3}, {-1, -3}, {-2, -2}, {-3, -1},
    {-3, 0}, {-3, 1}, {-2, 2}, {-1, 3}
};

// Input pixel structure - 8-bit data with AXI stream control signals
typedef ap_axiu<32, 0, 0, 0> pixel_axis_t;

// Output mask structure - 1-bit data with AXI stream control signals
typedef ap_axiu<32, 0, 0, 0> mask_axis_t;

// Main function declaration
void fast_ip(
    hls::stream<pixel_axis_t> &src_axi,
    hls::stream<mask_axis_t> &dst_axi,
    int img_width,
    int img_height,
    unsigned char threshold
);

#endif // FAST_IP_H