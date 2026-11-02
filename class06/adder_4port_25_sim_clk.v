`timescale 1ns / 1ps

module adder_4pport_25_sim_clk;

    reg clk = 1'b0;

    // 12 MHz: 주기 83.333 ns
    always #41.667 clk = ~clk;

    adder_4port_25_sim dut (
        .clk (clk)
    );

endmodule
