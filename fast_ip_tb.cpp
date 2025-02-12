#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>
#include "fast_ip.h"

// Test parameters
#define TEST_WIDTH 640
#define TEST_HEIGHT 480
#define TEST_THRESHOLD 20

// Helper function to generate test image
void generate_test_image(unsigned char* image, int width, int height) {
    std::srand(std::time(nullptr));
    for(int i = 0; i < width * height; i++) {
        image[i] = std::rand() % 256;
        
        // Add some synthetic corners
        if(i % (width * 40) == 0) {
            for(int j = 0; j < 16; j++) {
                int idx = i + j;
                if(idx < width * height) {
                    image[idx] = 255;
                }
            }
        }
    }
}

int main() {
    // Create test data
    unsigned char* test_image = new unsigned char[TEST_WIDTH * TEST_HEIGHT];
    generate_test_image(test_image, TEST_WIDTH, TEST_HEIGHT);
    
    // Create AXI streams
    hls::stream<pixel_axis_t> src_stream;
    hls::stream<mask_axis_t> dst_stream;
    
    // Fill input stream
    for(int y = 0; y < TEST_HEIGHT; y++) {
        for(int x = 0; x < TEST_WIDTH; x++) {
            pixel_axis_t pixel;
            pixel.data = test_image[y * TEST_WIDTH + x];
            pixel.last = (x == TEST_WIDTH-1 && y == TEST_HEIGHT-1);
            pixel.keep = 1;
            pixel.strb = 1;
            src_stream.write(pixel);
        }
    }
    
    // Run FAST corner detection
    fast_ip(src_stream, dst_stream, TEST_WIDTH, TEST_HEIGHT, TEST_THRESHOLD);
    
    // Process results
    int corner_count = 0;
    std::ofstream result_file("corners.txt");
    
    for(int y = 0; y < TEST_HEIGHT; y++) {
        for(int x = 0; x < TEST_WIDTH; x++) {
            mask_axis_t mask = dst_stream.read();
            if(mask.data == 1) {
                corner_count++;
                result_file << "Corner at (" << x << ", " << y << ")\n";
            }
        }
    }
    
    std::cout << "Found " << corner_count << " corners\n";
    result_file.close();
    delete[] test_image;
    
    return 0;
}