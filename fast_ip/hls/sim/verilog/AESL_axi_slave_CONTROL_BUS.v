// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_CONTROL_BUS (
    clk,
    reset,
    TRAN_s_axi_CONTROL_BUS_AWADDR,
    TRAN_s_axi_CONTROL_BUS_AWVALID,
    TRAN_s_axi_CONTROL_BUS_AWREADY,
    TRAN_s_axi_CONTROL_BUS_WVALID,
    TRAN_s_axi_CONTROL_BUS_WREADY,
    TRAN_s_axi_CONTROL_BUS_WDATA,
    TRAN_s_axi_CONTROL_BUS_WSTRB,
    TRAN_s_axi_CONTROL_BUS_ARADDR,
    TRAN_s_axi_CONTROL_BUS_ARVALID,
    TRAN_s_axi_CONTROL_BUS_ARREADY,
    TRAN_s_axi_CONTROL_BUS_RVALID,
    TRAN_s_axi_CONTROL_BUS_RREADY,
    TRAN_s_axi_CONTROL_BUS_RDATA,
    TRAN_s_axi_CONTROL_BUS_RRESP,
    TRAN_s_axi_CONTROL_BUS_BVALID,
    TRAN_s_axi_CONTROL_BUS_BREADY,
    TRAN_s_axi_CONTROL_BUS_BRESP,
    TRAN_CONTROL_BUS_write_data_finish,
    TRAN_CONTROL_BUS_start_in,
    TRAN_CONTROL_BUS_idle_out,
    TRAN_CONTROL_BUS_ready_out,
    TRAN_CONTROL_BUS_ready_in,
    TRAN_CONTROL_BUS_done_out,
    TRAN_CONTROL_BUS_write_start_in   ,
    TRAN_CONTROL_BUS_write_start_finish,
    TRAN_CONTROL_BUS_interrupt,
    TRAN_CONTROL_BUS_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_img_width "../tv/cdatafile/c.fast_ip.autotvin_img_width.dat"
`define TV_IN_img_height "../tv/cdatafile/c.fast_ip.autotvin_img_height.dat"
`define TV_IN_threshold "../tv/cdatafile/c.fast_ip.autotvin_threshold.dat"
parameter ADDR_WIDTH = 6;
parameter DATA_WIDTH = 32;
parameter img_width_DEPTH = 1;
reg [31 : 0] img_width_OPERATE_DEPTH = 0;
parameter img_width_c_bitwidth = 32;
parameter img_height_DEPTH = 1;
reg [31 : 0] img_height_OPERATE_DEPTH = 0;
parameter img_height_c_bitwidth = 32;
parameter threshold_DEPTH = 1;
reg [31 : 0] threshold_OPERATE_DEPTH = 0;
parameter threshold_c_bitwidth = 8;
parameter START_ADDR = 0;
parameter fast_ip_continue_addr = 0;
parameter fast_ip_auto_start_addr = 0;
parameter img_width_data_in_addr = 16;
parameter img_height_data_in_addr = 24;
parameter threshold_data_in_addr = 32;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_CONTROL_BUS_AWADDR;
output  TRAN_s_axi_CONTROL_BUS_AWVALID;
input  TRAN_s_axi_CONTROL_BUS_AWREADY;
output  TRAN_s_axi_CONTROL_BUS_WVALID;
input  TRAN_s_axi_CONTROL_BUS_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_CONTROL_BUS_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_CONTROL_BUS_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_CONTROL_BUS_ARADDR;
output  TRAN_s_axi_CONTROL_BUS_ARVALID;
input  TRAN_s_axi_CONTROL_BUS_ARREADY;
input  TRAN_s_axi_CONTROL_BUS_RVALID;
output  TRAN_s_axi_CONTROL_BUS_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_CONTROL_BUS_RDATA;
input [2 - 1 : 0] TRAN_s_axi_CONTROL_BUS_RRESP;
input  TRAN_s_axi_CONTROL_BUS_BVALID;
output  TRAN_s_axi_CONTROL_BUS_BREADY;
input [2 - 1 : 0] TRAN_s_axi_CONTROL_BUS_BRESP;
output TRAN_CONTROL_BUS_write_data_finish;
input     clk;
input     reset;
input     TRAN_CONTROL_BUS_start_in;
output    TRAN_CONTROL_BUS_done_out;
output    TRAN_CONTROL_BUS_ready_out;
input     TRAN_CONTROL_BUS_ready_in;
output    TRAN_CONTROL_BUS_idle_out;
input  TRAN_CONTROL_BUS_write_start_in   ;
output TRAN_CONTROL_BUS_write_start_finish;
input     TRAN_CONTROL_BUS_interrupt;
input     TRAN_CONTROL_BUS_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] mem_img_width [img_width_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_img_width [ (img_width_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * img_width_DEPTH -1 : 0] = '{default : 'hz};
reg img_width_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_img_height [img_height_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_img_height [ (img_height_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * img_height_DEPTH -1 : 0] = '{default : 'hz};
reg img_height_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_threshold [threshold_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_threshold [ (threshold_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * threshold_DEPTH -1 : 0] = '{default : 'hz};
reg threshold_write_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
//write img_width reg
reg [31 : 0] write_img_width_count = 0;
reg [31 : 0] img_width_diff_count = 0;
reg write_img_width_run_flag = 0;
reg write_one_img_width_data_done = 0;
//write img_height reg
reg [31 : 0] write_img_height_count = 0;
reg [31 : 0] img_height_diff_count = 0;
reg write_img_height_run_flag = 0;
reg write_one_img_height_data_done = 0;
//write threshold reg
reg [31 : 0] write_threshold_count = 0;
reg [31 : 0] threshold_diff_count = 0;
reg write_threshold_run_flag = 0;
reg write_one_threshold_data_done = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_CONTROL_BUS_AWADDR = AWADDR_reg;
assign TRAN_s_axi_CONTROL_BUS_AWVALID = AWVALID_reg;
assign TRAN_s_axi_CONTROL_BUS_WVALID = WVALID_reg;
assign TRAN_s_axi_CONTROL_BUS_WDATA = WDATA_reg;
assign TRAN_s_axi_CONTROL_BUS_WSTRB = WSTRB_reg;
assign TRAN_s_axi_CONTROL_BUS_ARADDR = ARADDR_reg;
assign TRAN_s_axi_CONTROL_BUS_ARVALID = ARVALID_reg;
assign TRAN_s_axi_CONTROL_BUS_RREADY = RREADY_reg;
assign TRAN_s_axi_CONTROL_BUS_BREADY = BREADY_reg;
assign TRAN_CONTROL_BUS_write_start_finish = AESL_write_start_finish;
assign TRAN_CONTROL_BUS_done_out = AESL_done_index_reg;
assign TRAN_CONTROL_BUS_ready_out = AESL_ready_out_index_reg;
assign TRAN_CONTROL_BUS_idle_out = AESL_idle_index_reg;
assign TRAN_CONTROL_BUS_write_data_finish = 1 & img_width_write_data_finish & img_height_write_data_finish & threshold_write_data_finish;
always @(TRAN_CONTROL_BUS_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_CONTROL_BUS_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 1024; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

function integer ceil_align_to_pow_of_two;
input integer a;
begin
    ceil_align_to_pow_of_two = $pow(2,$clog2(a));
end
endfunction

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_CONTROL_BUS_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_CONTROL_BUS_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_CONTROL_BUS_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_CONTROL_BUS_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_CONTROL_BUS_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_CONTROL_BUS_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_CONTROL_BUS_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_CONTROL_BUS_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_img_width_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (img_width_c_bitwidth, img_width_DEPTH, img_width_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_img_width_run_flag <= 1; 
        end
        else if ((write_one_img_width_data_done == 1 && write_img_width_count == img_width_diff_count - 1) || img_width_diff_count == 0) begin
            write_img_width_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_img_width_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_img_width_count = 0;
        end
        if (write_one_img_width_data_done === 1) begin
            write_img_width_count = write_img_width_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        img_width_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CONTROL_BUS_start_in === 1) begin
            img_width_write_data_finish <= 0;
        end
        if (write_img_width_run_flag == 1 && write_img_width_count == img_width_diff_count) begin
            img_width_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_img_width
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] img_width_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = img_width_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        img_width_diff_count = 0;

        for (k = 0; k < img_width_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (img_width_c_bitwidth < 32) begin
                    img_width_data_tmp_reg = mem_img_width[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < img_width_c_bitwidth) begin
                            img_width_data_tmp_reg[j] = mem_img_width[k][i*32 + j];
                        end
                        else begin
                            img_width_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_img_width[k * four_byte_num  + i]!==img_width_data_tmp_reg) begin
                img_width_diff_count = img_width_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_img_width
    integer write_img_width_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_img_width_count;
    reg [31 : 0] img_width_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = img_width_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_1_finish <= 0;

        for (check_img_width_count = 0; check_img_width_count < img_width_OPERATE_DEPTH; check_img_width_count = check_img_width_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_img_width_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write img_width data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (img_width_c_bitwidth < 32) begin
                        img_width_data_tmp_reg = mem_img_width[check_img_width_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < img_width_c_bitwidth) begin
                                img_width_data_tmp_reg[j] = mem_img_width[check_img_width_count][i*32 + j];
                            end
                            else begin
                                img_width_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_img_width[check_img_width_count * four_byte_num  + i]!==img_width_data_tmp_reg) begin
                        image_mem_img_width[check_img_width_count * four_byte_num + i]=img_width_data_tmp_reg;
                        write (img_width_data_in_addr + check_img_width_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, img_width_data_tmp_reg, write_img_width_resp);
                        write_one_img_width_data_done <= 1;
                        @(posedge clk);
                        write_one_img_width_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_1_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_img_height_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (img_height_c_bitwidth, img_height_DEPTH, img_height_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_img_height_run_flag <= 1; 
        end
        else if ((write_one_img_height_data_done == 1 && write_img_height_count == img_height_diff_count - 1) || img_height_diff_count == 0) begin
            write_img_height_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_img_height_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_img_height_count = 0;
        end
        if (write_one_img_height_data_done === 1) begin
            write_img_height_count = write_img_height_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        img_height_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CONTROL_BUS_start_in === 1) begin
            img_height_write_data_finish <= 0;
        end
        if (write_img_height_run_flag == 1 && write_img_height_count == img_height_diff_count) begin
            img_height_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_img_height
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] img_height_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = img_height_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        img_height_diff_count = 0;

        for (k = 0; k < img_height_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (img_height_c_bitwidth < 32) begin
                    img_height_data_tmp_reg = mem_img_height[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < img_height_c_bitwidth) begin
                            img_height_data_tmp_reg[j] = mem_img_height[k][i*32 + j];
                        end
                        else begin
                            img_height_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_img_height[k * four_byte_num  + i]!==img_height_data_tmp_reg) begin
                img_height_diff_count = img_height_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_img_height
    integer write_img_height_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_img_height_count;
    reg [31 : 0] img_height_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = img_height_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_2_finish <= 0;

        for (check_img_height_count = 0; check_img_height_count < img_height_OPERATE_DEPTH; check_img_height_count = check_img_height_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_img_height_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write img_height data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (img_height_c_bitwidth < 32) begin
                        img_height_data_tmp_reg = mem_img_height[check_img_height_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < img_height_c_bitwidth) begin
                                img_height_data_tmp_reg[j] = mem_img_height[check_img_height_count][i*32 + j];
                            end
                            else begin
                                img_height_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_img_height[check_img_height_count * four_byte_num  + i]!==img_height_data_tmp_reg) begin
                        image_mem_img_height[check_img_height_count * four_byte_num + i]=img_height_data_tmp_reg;
                        write (img_height_data_in_addr + check_img_height_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, img_height_data_tmp_reg, write_img_height_resp);
                        write_one_img_height_data_done <= 1;
                        @(posedge clk);
                        write_one_img_height_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_2_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_threshold_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (threshold_c_bitwidth, threshold_DEPTH, threshold_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_threshold_run_flag <= 1; 
        end
        else if ((write_one_threshold_data_done == 1 && write_threshold_count == threshold_diff_count - 1) || threshold_diff_count == 0) begin
            write_threshold_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_threshold_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_threshold_count = 0;
        end
        if (write_one_threshold_data_done === 1) begin
            write_threshold_count = write_threshold_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        threshold_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CONTROL_BUS_start_in === 1) begin
            threshold_write_data_finish <= 0;
        end
        if (write_threshold_run_flag == 1 && write_threshold_count == threshold_diff_count) begin
            threshold_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_threshold
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] threshold_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = threshold_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        threshold_diff_count = 0;

        for (k = 0; k < threshold_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (threshold_c_bitwidth < 32) begin
                    threshold_data_tmp_reg = mem_threshold[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < threshold_c_bitwidth) begin
                            threshold_data_tmp_reg[j] = mem_threshold[k][i*32 + j];
                        end
                        else begin
                            threshold_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_threshold[k * four_byte_num  + i]!==threshold_data_tmp_reg) begin
                threshold_diff_count = threshold_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_threshold
    integer write_threshold_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_threshold_count;
    reg [31 : 0] threshold_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = threshold_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_3_finish <= 0;

        for (check_threshold_count = 0; check_threshold_count < threshold_OPERATE_DEPTH; check_threshold_count = check_threshold_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_threshold_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write threshold data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (threshold_c_bitwidth < 32) begin
                        threshold_data_tmp_reg = mem_threshold[check_threshold_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < threshold_c_bitwidth) begin
                                threshold_data_tmp_reg[j] = mem_threshold[check_threshold_count][i*32 + j];
                            end
                            else begin
                                threshold_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_threshold[check_threshold_count * four_byte_num  + i]!==threshold_data_tmp_reg) begin
                        image_mem_threshold[check_threshold_count * four_byte_num + i]=threshold_data_tmp_reg;
                        write (threshold_data_in_addr + check_threshold_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, threshold_data_tmp_reg, write_threshold_resp);
                        write_one_threshold_data_done <= 1;
                        @(posedge clk);
                        write_one_threshold_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_3_finish <= 1;
        @(posedge clk);
    end    
end


always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_CONTROL_BUS_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 4;
    while (1) begin
        process_4_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_4_finish <= 1;
        end 
        @(posedge clk);
    end
end

//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [127 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_img_width_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [img_width_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (img_width_c_bitwidth , factor);
  fp = $fopen(`TV_IN_img_width ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_img_width); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < img_width_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_img_width [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_img_width [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_img_width [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_img_width [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_img_width [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_img_width;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_img_height_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [img_height_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (img_height_c_bitwidth , factor);
  fp = $fopen(`TV_IN_img_height ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_img_height); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < img_height_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_img_height [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_img_height [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_img_height [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_img_height [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_img_height [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_img_height;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_threshold_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [threshold_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (threshold_c_bitwidth , factor);
  fp = $fopen(`TV_IN_threshold ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_threshold); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < threshold_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_threshold [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_threshold [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_threshold [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_threshold [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_threshold [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_threshold;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
endmodule
