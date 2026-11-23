`timescale 1ns/1ps

module uart_tb;

    parameter CLKS_PER_BIT = 104;   
    localparam real CLK_PERIOD = 83.333; 
    localparam real BIT_PERIOD = CLK_PERIOD * CLKS_PER_BIT;

    reg clk = 1'b0;
    always #(CLK_PERIOD/2) clk = ~clk;

    reg        tx_dv     = 1'b0;
    reg  [7:0] tx_byte   = 8'h00;
    wire       tx_done;
    reg        rx_serial = 1'b1;
    wire [7:0] rx_byte;

    uart_tx #(.CLKS_PER_BIT(CLKS_PER_BIT)) u_tx (
        .i_Clock(clk), .i_Tx_DV(tx_dv), .i_Tx_Byte(tx_byte),
        .o_Tx_Active(), .o_Tx_Serial(), .o_Tx_Done(tx_done)
    );

    uart_rx #(.CLKS_PER_BIT(CLKS_PER_BIT)) u_rx (
        .i_Clock(clk), .i_Rx_Serial(rx_serial),
        .o_Rx_DV(), .o_Rx_Byte(rx_byte)
    );

    task uart_write_byte(input [7:0] d);
        integer i;
        begin
            rx_serial = 1'b0;                 #(BIT_PERIOD);
            for (i = 0; i < 8; i = i + 1) begin
                rx_serial = d[i];             #(BIT_PERIOD);
            end
            rx_serial = 1'b1;                 #(BIT_PERIOD);
        end
    endtask

    initial begin
        @(posedge clk);
        @(posedge clk);
        tx_dv   <= 1'b1;
        tx_byte <= 8'hAB;
        @(posedge clk);
        tx_dv   <= 1'b0;
        @(posedge tx_done);

        @(posedge clk);
        uart_write_byte(8'h3F);
        @(posedge clk);

        if (rx_byte == 8'h3F)
            $display("Test Passed - Correct Byte Received");
        else
            $display("Test Failed - Incorrect Byte Received");

        $finish;
    end

endmodule
