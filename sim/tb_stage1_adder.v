`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : Dulipudi Laashmith Sanjay
// 
// Design Name   : Testbench for Stage 1 (Four 8-bit Adders)
// Module Name   : tb_stage1_adder
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Testbench for Stage 1 of the pipeline. Verifies 4 parallel additions 
//   and proper pipeline register updates.
// 
// Dependencies  : stage1_adder
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
module tb_stage1_adder;
    reg clk, rst;
    reg [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
    wire [7:0] s0_reg, s1_reg, s2_reg, s3_reg;

    stage1_adder uut (.clk(clk), .rst(rst),
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .s0_reg(s0_reg), .s1_reg(s1_reg), .s2_reg(s2_reg), .s3_reg(s3_reg));

    always #5 clk = ~clk;

    initial begin
        $display("Time | s0 s1 s2 s3");
        $monitor("%0dns | %h %h %h %h", $time, s0_reg, s1_reg, s2_reg, s3_reg);

        clk=0; rst=1;
        in0=0;in1=0;in2=0;in3=0;in4=0;in5=0;in6=0;in7=0; #10; rst=0;

        in0=8'h01; in1=8'h02; in2=8'h03; in3=8'h04;
        in4=8'h05; in5=8'h06; in6=8'h07; in7=8'h08; #20;

        $finish;
    end
endmodule
