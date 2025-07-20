`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : DULIPUDI LAASHMITH SANJAY
// 
// Design Name   : Pipeline Stage 3 (Final Adder)
// Module Name   : stage3_adder
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Final stage of the pipelined adder tree. Adds two registered 
//   partial sums from Stage 2 and stores the final 8-bit sum.
// 
// Dependencies  : adder_8bit, dff_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module stage3_adder (
    input        clk,
    input        rst,
    input  [7:0] p0_reg,
    input  [7:0] p1_reg,
    output [7:0] final_sum_reg
);
    reg [7:0] p0_delay, p1_delay;
    wire [7:0] final_sum;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            p0_delay <= 8'd0;
            p1_delay <= 8'd0;
        end else begin
            p0_delay <= p0_reg;
            p1_delay <= p1_reg;
        end
    end
    adder_8bit A0 (.a(p0_delay), .b(p1_delay), .sum(final_sum));
    dff_8bit D0 (.clk(clk), .rst(rst), .d(final_sum), .q(final_sum_reg));
endmodule
