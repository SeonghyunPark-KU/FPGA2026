`timescale 1ns / 1ps

module UART(
    input  wire clk,
    input  wire uart_txd_in, 
    output wire uart_rxd_out 
);
    wire [7:0] rx_data;
    wire       rx_valid;
    wire       tx_busy;

    uart_rx #(.CLKS_PER_BIT(104)) u_rx (
        .clk(clk), .rx(uart_txd_in), .data(rx_data), .valid(rx_valid)
    );

    reg       tx_start  = 0;
    reg [7:0] tx_data   = 0;
    reg       pend      = 0;
    reg [7:0] pend_data = 0;

    always @(posedge clk) begin
        tx_start <= 1'b0;
        if (rx_valid) begin
            if (!tx_busy && !tx_start) begin
                tx_data  <= rx_data + 8'd1;
                tx_start <= 1'b1;
            end else begin
                pend_data <= rx_data + 8'd1;
                pend      <= 1'b1;
            end
        end else if (pend && !tx_busy && !tx_start) begin
            tx_data  <= pend_data;
            tx_start <= 1'b1;
            pend     <= 1'b0;
        end
    end

    uart_tx #(.CLKS_PER_BIT(104)) u_tx (
        .clk(clk), .start(tx_start), .data(tx_data),
        .tx(uart_rxd_out), .busy(tx_busy)
    );
endmodule
