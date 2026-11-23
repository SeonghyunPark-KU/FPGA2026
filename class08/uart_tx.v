`timescale 1ns / 1ps

module uart_tx #(parameter CLKS_PER_BIT = 104)(
    input  wire       clk,
    input  wire       start,
    input  wire [7:0] data,
    output reg        tx = 1'b1,
    output wire       busy
);
    reg [9:0]  sh  = 10'h3FF;   // {stop, data[7:0], start}
    reg [3:0]  n   = 0;
    reg [15:0] cnt = 0;

    assign busy = (n != 0);

    always @(posedge clk) begin
        if (n == 0) begin
            tx <= 1'b1;
            if (start) begin
                sh  <= {1'b1, data, 1'b0};
                tx  <= 1'b0;        // start bit
                n   <= 4'd10;
                cnt <= 0;
            end
        end else begin
            if (cnt == CLKS_PER_BIT - 1) begin
                cnt <= 0;
                sh  <= {1'b1, sh[9:1]};
                tx  <= sh[1];
                n   <= n - 1;
            end else cnt <= cnt + 1;
        end
    end
endmodule
