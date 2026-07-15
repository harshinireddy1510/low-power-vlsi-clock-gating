
module counter_clock_gated(
    input clk,
    input rst,
    input enable,
    output reg [7:0] count
);
 wire gated_clk;
 assign gated_clk = clk & enable;
 always @(posedge gated_clk or posedge rst)
begin
    if(rst)
        count <= 0;
    else
        count <= count + 1;end
 
endmodule