// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of img_width
//        bit 31~0 - img_width[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of img_height
//        bit 31~0 - img_height[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of threshold
//        bit 7~0 - threshold[7:0] (Read/Write)
//        others  - reserved
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_BUS_ADDR_AP_CTRL         0x00
#define CONTROL_BUS_ADDR_GIE             0x04
#define CONTROL_BUS_ADDR_IER             0x08
#define CONTROL_BUS_ADDR_ISR             0x0c
#define CONTROL_BUS_ADDR_IMG_WIDTH_DATA  0x10
#define CONTROL_BUS_BITS_IMG_WIDTH_DATA  32
#define CONTROL_BUS_ADDR_IMG_HEIGHT_DATA 0x18
#define CONTROL_BUS_BITS_IMG_HEIGHT_DATA 32
#define CONTROL_BUS_ADDR_THRESHOLD_DATA  0x20
#define CONTROL_BUS_BITS_THRESHOLD_DATA  8
