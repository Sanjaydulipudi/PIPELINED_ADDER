`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : DULIPUDI LAASHMITH SANJAY
// 
// Design Name   : 8-bit D Flip-Flop
// Module Name   : dff_8bit
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   A synchronous 8-bit D Flip-Flop with asynchronous reset. Used to store 
//   pipeline stage outputs at each clock cycle.
// 
// Dependencies  : None
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module dff_8bit (
    input        clk,
    input        rst,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 8'd0;
        else
            q <= d;
    end
endmodule
