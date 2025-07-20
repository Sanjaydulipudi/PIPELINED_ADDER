`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : DULIPUDI LAASHMITH SANJAY
// 
// Design Name   : Pipeline Stage 2 (Two 8-bit Adders)
// Module Name   : stage2_adder
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Second stage of the pipelined adder tree. Takes 4 registered sums 
//   from Stage 1, performs two parallel additions (s0+s1, s2+s3), 
//   and stores results in pipeline registers.
// 
// Dependencies  : adder_8bit, dff_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module stage2_adder (
    input        clk,
    input        rst,
    input  [7:0] s0_reg, s1_reg, s2_reg, s3_reg,
    output [7:0] p0_reg, p1_reg
);
    wire [7:0] p0, p1;

    adder_8bit A0 (.a(s0_reg), .b(s1_reg), .sum(p0));
    adder_8bit A1 (.a(s2_reg), .b(s3_reg), .sum(p1));

    dff_8bit D0 (.clk(clk), .rst(rst), .d(p0), .q(p0_reg));
    dff_8bit D1 (.clk(clk), .rst(rst), .d(p1), .q(p1_reg));
endmodule
