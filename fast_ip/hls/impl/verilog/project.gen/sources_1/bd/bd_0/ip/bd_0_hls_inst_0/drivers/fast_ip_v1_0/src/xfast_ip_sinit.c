// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfast_ip.h"

extern XFast_ip_Config XFast_ip_ConfigTable[];

#ifdef SDT
XFast_ip_Config *XFast_ip_LookupConfig(UINTPTR BaseAddress) {
	XFast_ip_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFast_ip_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFast_ip_ConfigTable[Index].Control_bus_BaseAddress == BaseAddress) {
			ConfigPtr = &XFast_ip_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFast_ip_Initialize(XFast_ip *InstancePtr, UINTPTR BaseAddress) {
	XFast_ip_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFast_ip_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFast_ip_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFast_ip_Config *XFast_ip_LookupConfig(u16 DeviceId) {
	XFast_ip_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFAST_IP_NUM_INSTANCES; Index++) {
		if (XFast_ip_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFast_ip_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFast_ip_Initialize(XFast_ip *InstancePtr, u16 DeviceId) {
	XFast_ip_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFast_ip_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFast_ip_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

