`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 12:04:05
// Design Name: 
// Module Name: tb_adder_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps
module tb_adder_8bit;
    reg  [7:0] a, b;
    wire [7:0] sum;

    adder_8bit uut (.a(a), .b(b), .sum(sum));

    initial begin
        $display("Time | a b sum");
        $monitor("%0dns | %h %h %h", $time, a, b, sum);

        a=8'h05; b=8'h03; #10;
        a=8'h10; b=8'h20; #10;
        a=8'hAA; b=8'h55; #10;

        $finish;
    end
endmodule
