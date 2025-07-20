`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : Dulipudi Laashmith Sanjay
// 
// Design Name   : Testbench for 8-bit D Flip-Flop
// Module Name   : tb_dff_8bit
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Testbench for the synchronous 8-bit DFF with asynchronous reset. 
//   Verifies data storage and reset operation.
// 
// Dependencies  : dff_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module tb_dff_8bit;
    reg clk, rst;
    reg [7:0] d;
    wire [7:0] q;

    dff_8bit uut (.clk(clk), .rst(rst), .d(d), .q(q));

    always #5 clk = ~clk; // 10ns clock

    initial begin
        $display("Time | clk rst d q");
        $monitor("%0dns | %b %b %h %h", $time, clk, rst, d, q);

        clk=0; rst=1; d=8'h00; #10;
        rst=0;

        d=8'hAA; #10;
        d=8'h55; #10;
        d=8'hFF; #10;

        $finish;
    end
endmodule
