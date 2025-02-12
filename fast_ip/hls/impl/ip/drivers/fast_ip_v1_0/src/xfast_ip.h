// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFAST_IP_H
#define XFAST_IP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfast_ip_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_bus_BaseAddress;
} XFast_ip_Config;
#endif

typedef struct {
    u64 Control_bus_BaseAddress;
    u32 IsReady;
} XFast_ip;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFast_ip_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFast_ip_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFast_ip_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFast_ip_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFast_ip_Initialize(XFast_ip *InstancePtr, UINTPTR BaseAddress);
XFast_ip_Config* XFast_ip_LookupConfig(UINTPTR BaseAddress);
#else
int XFast_ip_Initialize(XFast_ip *InstancePtr, u16 DeviceId);
XFast_ip_Config* XFast_ip_LookupConfig(u16 DeviceId);
#endif
int XFast_ip_CfgInitialize(XFast_ip *InstancePtr, XFast_ip_Config *ConfigPtr);
#else
int XFast_ip_Initialize(XFast_ip *InstancePtr, const char* InstanceName);
int XFast_ip_Release(XFast_ip *InstancePtr);
#endif

void XFast_ip_Start(XFast_ip *InstancePtr);
u32 XFast_ip_IsDone(XFast_ip *InstancePtr);
u32 XFast_ip_IsIdle(XFast_ip *InstancePtr);
u32 XFast_ip_IsReady(XFast_ip *InstancePtr);
void XFast_ip_EnableAutoRestart(XFast_ip *InstancePtr);
void XFast_ip_DisableAutoRestart(XFast_ip *InstancePtr);

void XFast_ip_Set_img_width(XFast_ip *InstancePtr, u32 Data);
u32 XFast_ip_Get_img_width(XFast_ip *InstancePtr);
void XFast_ip_Set_img_height(XFast_ip *InstancePtr, u32 Data);
u32 XFast_ip_Get_img_height(XFast_ip *InstancePtr);
void XFast_ip_Set_threshold(XFast_ip *InstancePtr, u32 Data);
u32 XFast_ip_Get_threshold(XFast_ip *InstancePtr);

void XFast_ip_InterruptGlobalEnable(XFast_ip *InstancePtr);
void XFast_ip_InterruptGlobalDisable(XFast_ip *InstancePtr);
void XFast_ip_InterruptEnable(XFast_ip *InstancePtr, u32 Mask);
void XFast_ip_InterruptDisable(XFast_ip *InstancePtr, u32 Mask);
void XFast_ip_InterruptClear(XFast_ip *InstancePtr, u32 Mask);
u32 XFast_ip_InterruptGetEnabled(XFast_ip *InstancePtr);
u32 XFast_ip_InterruptGetStatus(XFast_ip *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
