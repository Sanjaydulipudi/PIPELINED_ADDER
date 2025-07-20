module stage2_adder (
    input        clk,
    input        rst,
    input  [7:0] s0_reg, s1_reg, s2_reg, s3_reg,
    output [7:0] p0_reg, p1_reg
);
    wire [7:0] p0, p1;
    adder_8bit A0 (.a(s0_reg), .b(s1_reg), .sum(p0));
    adder_8bit A1 (.a(s2_reg), .b(s3_reg), .sum(p1));
    dff_8bit D0 (.clk(clk), .rst(rst), .d(p0), .q(p0_reg));
    dff_8bit D1 (.clk(clk), .rst(rst), .d(p1), .q(p1_reg));
endmodule
