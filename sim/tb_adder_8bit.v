`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : Dulipudi Laashmith Sanjay
// 
// Design Name   : Testbench for 8-bit Adder
// Module Name   : tb_adder_8bit
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Testbench for the simple 8-bit combinational adder. Verifies correct 
//   addition and wrap-around behavior.
// 
// Dependencies  : adder_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module tb_adder_8bit;

    reg  [7:0] a, b;
    wire [7:0] sum;

    adder_8bit uut (.a(a), .b(b), .sum(sum));

    initial begin
        $display("==============================================");
        $display("      8-bit Adder Testbench Simulation");
        $display("==============================================");
        $display("Time\tA\tB\tSUM");

        $monitor("%0dns\t%3d\t%3d\t%3d", $time, a, b, sum);

        a=5;   b=3;   #10;   // 5+3 = 8
        a=10;  b=20;  #10;   // 10+20 = 30
        a=170; b=85;  #10;   // 170+85 = 255
        a=255; b=1;   #10;   // 255+1 wraps to 0 (8-bit overflow)

        $display("==============================================");
        $display("Simulation Completed ✅");
        $finish;
    end
endmodule
