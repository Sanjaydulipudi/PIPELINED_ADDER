`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : DULIPUDI LAASSHMITH SANJAY
// 
// Design Name   : Pipeline Stage 1 (Four 8-bit Adders)
// Module Name   : stage1_adder
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   First stage of the pipelined adder tree. Takes 8 inputs, performs 
//   four parallel additions (in0+in1, in2+in3, in4+in5, in6+in7), and 
//   stores results in pipeline registers.
// 
// Dependencies  : adder_8bit, dff_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module stage1_adder (
    input        clk,
    input        rst,
    input  [7:0] in0, in1, in2, in3, in4, in5, in6, in7,
    output [7:0] s0_reg, s1_reg, s2_reg, s3_reg
);
    wire [7:0] s0, s1, s2, s3;

    adder_8bit A0 (.a(in0), .b(in1), .sum(s0));
    adder_8bit A1 (.a(in2), .b(in3), .sum(s1));
    adder_8bit A2 (.a(in4), .b(in5), .sum(s2));
    adder_8bit A3 (.a(in6), .b(in7), .sum(s3));

    dff_8bit D0 (.clk(clk), .rst(rst), .d(s0), .q(s0_reg));
    dff_8bit D1 (.clk(clk), .rst(rst), .d(s1), .q(s1_reg));
    dff_8bit D2 (.clk(clk), .rst(rst), .d(s2), .q(s2_reg));
    dff_8bit D3 (.clk(clk), .rst(rst), .d(s3), .q(s3_reg));
endmodule
