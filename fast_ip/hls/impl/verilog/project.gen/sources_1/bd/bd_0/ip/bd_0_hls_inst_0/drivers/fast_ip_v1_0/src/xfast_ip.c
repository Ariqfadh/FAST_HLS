// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfast_ip.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFast_ip_CfgInitialize(XFast_ip *InstancePtr, XFast_ip_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_bus_BaseAddress = ConfigPtr->Control_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFast_ip_Start(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL) & 0x80;
    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFast_ip_IsDone(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFast_ip_IsIdle(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFast_ip_IsReady(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFast_ip_EnableAutoRestart(XFast_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL, 0x80);
}

void XFast_ip_DisableAutoRestart(XFast_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_AP_CTRL, 0);
}

void XFast_ip_Set_img_width(XFast_ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IMG_WIDTH_DATA, Data);
}

u32 XFast_ip_Get_img_width(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IMG_WIDTH_DATA);
    return Data;
}

void XFast_ip_Set_img_height(XFast_ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IMG_HEIGHT_DATA, Data);
}

u32 XFast_ip_Get_img_height(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IMG_HEIGHT_DATA);
    return Data;
}

void XFast_ip_Set_threshold(XFast_ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_THRESHOLD_DATA, Data);
}

u32 XFast_ip_Get_threshold(XFast_ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_THRESHOLD_DATA);
    return Data;
}

void XFast_ip_InterruptGlobalEnable(XFast_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_GIE, 1);
}

void XFast_ip_InterruptGlobalDisable(XFast_ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_GIE, 0);
}

void XFast_ip_InterruptEnable(XFast_ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IER);
    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IER, Register | Mask);
}

void XFast_ip_InterruptDisable(XFast_ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IER);
    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IER, Register & (~Mask));
}

void XFast_ip_InterruptClear(XFast_ip *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFast_ip_WriteReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_ISR, Mask);
}

u32 XFast_ip_InterruptGetEnabled(XFast_ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_IER);
}

u32 XFast_ip_InterruptGetStatus(XFast_ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFast_ip_ReadReg(InstancePtr->Control_bus_BaseAddress, XFAST_IP_CONTROL_BUS_ADDR_ISR);
}

