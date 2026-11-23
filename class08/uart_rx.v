`timescale 1ns / 1ps

module uart_rx #(parameter CLKS_PER_BIT = 104)(
    input  wire       clk,
    input  wire       rx,
    output reg  [7:0] data  = 0,
    output reg        valid = 0
);
    //
    reg [1:0] sync = 2'b11;
    always @(posedge clk) sync <= {sync[0], rx};
    wire rx_s = sync[1];

    localparam IDLE = 2'd0, START = 2'd1, DATA = 2'd2, STOP = 2'd3;
    reg [1:0]  state = IDLE;
    reg [15:0] cnt   = 0;
    reg [2:0]  idx   = 0;
    reg [7:0]  sh    = 0;

    always @(posedge clk) begin
        valid <= 1'b0;
        case (state)
            IDLE: begin
                cnt <= 0;
                idx <= 0;
                if (rx_s == 1'b0) state <= START;
            end
            // Wait for center
            START: begin
                if (cnt == (CLKS_PER_BIT/2) - 1) begin
                    cnt <= 0;
                    state <= (rx_s == 1'b0) ? DATA : IDLE;
                end else cnt <= cnt + 1;
            end
            // Sampling per cycle
            DATA: begin
                if (cnt == CLKS_PER_BIT - 1) begin
                    cnt <= 0;
                    sh  <= {rx_s, sh[7:1]};
                    if (idx == 3'd7) state <= STOP;
                    else idx <= idx + 1;
                end else cnt <= cnt + 1;
            end
            STOP: begin
                if (cnt == CLKS_PER_BIT - 1) begin
                    cnt   <= 0;
                    data  <= sh;
                    valid <= 1'b1;
                    state <= IDLE;
                end else cnt <= cnt + 1;
            end
        endcase
    end
endmodule