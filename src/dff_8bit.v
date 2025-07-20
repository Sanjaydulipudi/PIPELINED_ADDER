module dff_8bit (
    input        clk,
    input        rst,
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 8'd0;
        else
            q <= d;
    end
endmodule
