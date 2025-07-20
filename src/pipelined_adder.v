module pipelined_adder (
    input        clk,
    input        rst,
    input  [7:0] in0, in1, in2, in3, in4, in5, in6, in7,
    output [7:0] final_sum_reg
);
    wire [7:0] s0_reg, s1_reg, s2_reg, s3_reg;
    wire [7:0] p0_reg, p1_reg;
    stage1_adder ST1 (.clk(clk), .rst(rst),
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .s0_reg(s0_reg), .s1_reg(s1_reg), .s2_reg(s2_reg), .s3_reg(s3_reg));
    stage2_adder ST2 (.clk(clk), .rst(rst),
        .s0_reg(s0_reg), .s1_reg(s1_reg),
        .s2_reg(s2_reg), .s3_reg(s3_reg),
        .p0_reg(p0_reg), .p1_reg(p1_reg));
    stage3_adder ST3 (.clk(clk), .rst(rst),
        .p0_reg(p0_reg), .p1_reg(p1_reg),
        .final_sum_reg(final_sum_reg));
endmodule
