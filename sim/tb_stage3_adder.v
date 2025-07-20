`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 12:07:58
// Design Name: 
// Module Name: tb_stage3_adder
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
module tb_stage3_adder;
    reg clk, rst;
    reg [7:0] p0_reg, p1_reg;
    wire [7:0] final_sum_reg;

    stage3_adder uut (.clk(clk), .rst(rst), .p0_reg(p0_reg), .p1_reg(p1_reg), .final_sum_reg(final_sum_reg));

    always #5 clk = ~clk;

    initial begin
        $display("Time | final");
        $monitor("%0dns | %h", $time, final_sum_reg);

        clk=0; rst=1; p0_reg=0; p1_reg=0; #10; rst=0;
        p0_reg=8'h0A; p1_reg=8'h1A; #10; // Expected 24
        $finish;
    end
endmodule
