`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College       : Vasireddy Venkatadri Institute of Technology
// Author        : Dulipudi Laashmith Sanjay
// 
// Design Name   : Testbench for Full Pipelined 8-Input Adder Tree
// Module Name   : tb_pipelined_adder
// Project Name  : Pipelined 8-Input Adder Tree
// Target Device : Artix-7 (xc7a35tftg256-1)
// Tool Version  : Vivado 2025.1
// Description   : 
//   Final testbench for the full 3-stage pipelined 8-input adder tree. 
//   Verifies correct pipelined operation with multiple test cases, 
//   showcasing delay between stages and final results.
// 
// Dependencies  : pipelined_adder, stage1_adder, stage2_adder, stage3_adder,
//                 adder_8bit, dff_8bit
// 
// Revision:
//   0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

module tb_pipelined_adder;

    reg clk, rst;
    reg [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
    wire [7:0] final_sum_reg;

    // Instantiate the full pipelined adder
    pipelined_adder uut (
        .clk(clk), .rst(rst),
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .final_sum_reg(final_sum_reg)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    // Task to apply one set of inputs for 1 clock cycle
    task apply_inputs;
        input [7:0] a0,a1,a2,a3,a4,a5,a6,a7;
        begin
            in0=a0; in1=a1; in2=a2; in3=a3;
            in4=a4; in5=a5; in6=a6; in7=a7;
            #10; // Wait 1 clock cycle
        end
    endtask

    initial begin
        $display("===========================================================");
        $display(" Pipelined 8-Input Adder Tree Simulation (CLEAN TEST CASES)");
        $display("===========================================================");
        $display("Time | s0  s1  s2  s3 | p0   p1  | Final");
        $display("-----------------------------------------------------------");

        $monitor("%3dns | %3d %3d %3d %3d | %3d %4d | %3d",
            $time,
            uut.s0_reg, uut.s1_reg, uut.s2_reg, uut.s3_reg,
            uut.p0_reg, uut.p1_reg,
            final_sum_reg
        );

        // Reset
        clk = 0; rst = 1;
        in0=0; in1=0; in2=0; in3=0; in4=0; in5=0; in6=0; in7=0;
        #10; rst = 0;

        // ✅ Test Case 1
        apply_inputs(1,2,3,4,5,6,7,8);

        // ✅ Test Case 2
        apply_inputs(10,20,30,40,50,60,70,80);

        // ✅ Test Case 3
        apply_inputs(0,0,0,0,0,0,0,0);

        // ✅ Test Case 4
        apply_inputs(5,10,15,20,25,30,35,40);

        // ✅ Test Case 5
        apply_inputs(255,255,255,255,255,255,255,255);

        #100;
        $display("-----------------------------------------------------------");
        $display("Simulation Completed ✅");
        $finish;
    end
endmodule
