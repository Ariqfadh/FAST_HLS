set SynModuleInfo {
  {SRCNAME fast_ip_Pipeline_col_loop MODELNAME fast_ip_Pipeline_col_loop RTLNAME fast_ip_fast_ip_Pipeline_col_loop
    SUBMODULES {
      {MODELNAME fast_ip_sparsemux_33_4_8_1_1 RTLNAME fast_ip_sparsemux_33_4_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME fast_ip_fast_ip_Pipeline_col_loop_p_ZZ7fast_ipRN3hls6streamINS_4axisI7ap_uintILi32EELbkb RTLNAME fast_ip_fast_ip_Pipeline_col_loop_p_ZZ7fast_ipRN3hls6streamINS_4axisI7ap_uintILi32EELbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fast_ip_fast_ip_Pipeline_col_loop_p_ZZ7fast_ipRN3hls6streamINS_4axisI7ap_uintILi32EELbJp RTLNAME fast_ip_fast_ip_Pipeline_col_loop_p_ZZ7fast_ipRN3hls6streamINS_4axisI7ap_uintILi32EELbJp BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fast_ip_flow_control_loop_pipe_sequential_init RTLNAME fast_ip_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fast_ip_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fast_ip MODELNAME fast_ip RTLNAME fast_ip IS_TOP 1
    SUBMODULES {
      {MODELNAME fast_ip_CONTROL_BUS_s_axi RTLNAME fast_ip_CONTROL_BUS_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME fast_ip_regslice_both RTLNAME fast_ip_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
