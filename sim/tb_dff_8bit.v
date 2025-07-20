`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 12:03:09
// Design Name: 
// Module Name: tb_dff_8bit
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
