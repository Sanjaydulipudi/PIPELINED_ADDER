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
