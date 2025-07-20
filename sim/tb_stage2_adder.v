`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 12:06:45
// Design Name: 
// Module Name: tb_stage2_adder
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
module tb_stage2_adder;
    reg clk, rst;
    reg [7:0] s0_reg, s1_reg, s2_reg, s3_reg;
    wire [7:0] p0_reg, p1_reg;

    stage2_adder uut (.clk(clk), .rst(rst),
        .s0_reg(s0_reg), .s1_reg(s1_reg), .s2_reg(s2_reg), .s3_reg(s3_reg),
        .p0_reg(p0_reg), .p1_reg(p1_reg));

    always #5 clk = ~clk;

    initial begin
        $display("Time | p0 p1");
        $monitor("%0dns | %h %h", $time, p0_reg, p1_reg);

        clk=0; rst=1; s0_reg=0; s1_reg=0; s2_reg=0; s3_reg=0; #10; rst=0;

        s0_reg=8'h03; s1_reg=8'h07; s2_reg=8'h0B; s3_reg=8'h0F; #10;
        $finish;
    end
endmodule
