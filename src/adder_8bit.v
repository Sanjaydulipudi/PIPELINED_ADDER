`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : DULIPUDI LAASHMITH SANJAY
// 
// Design Name   : 8-bit Adder
// Module Name   : adder_8bit
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   A simple combinational 8-bit adder. Adds two 8-bit inputs and produces 
//   an 8-bit sum. This module is used in all three pipeline stages.
// 
// Dependencies  : None
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module adder_8bit (
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] sum
);
    assign sum = a + b;
endmodule
