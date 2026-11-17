`timescale 1ns / 1ps

module adder_5port_sim_clk;

    reg clk = 1'b0;

    // 12 MHz: 주기 83.333 ns
    always #41.667 clk = ~clk;

    adder_5port_sim dut (
        .clk (clk)
    );

endmodule