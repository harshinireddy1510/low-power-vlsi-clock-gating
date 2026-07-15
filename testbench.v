`timescale 1ns / 1ps
module tb_counter;
    reg clk;
    reg rst;
    reg enable;
    wire [7:0] count_normal;
    wire [7:0] count_gated;
    // Normal Counter
    counter_normal uut1 (
        .clk(clk),
        .rst(rst),
        .count(count_normal)
    );
    // Clock Gated Counter
    counter_clock_gated uut2 (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count_gated)
    );
    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns clock period
    end
    // Test Stimulus
    initial begin
        rst = 1;
        enable = 1;
        #20;
        rst = 0;
        // Counter runs
        #100;
        // Disable clock gating
        enable = 0;
        #100;
  // Enable again
        enable = 1;
        #100;
        $finish;
    end
endmodule
