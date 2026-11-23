module uart_rx #(parameter CLKS_PER_BIT = 104)(
    input  wire       i_Clock,
    input  wire       i_Rx_Serial,
    output reg        o_Rx_DV   = 1'b0,
    output reg  [7:0] o_Rx_Byte = 8'h00
);
    localparam IDLE = 2'd0, START = 2'd1, DATA = 2'd2, STOP = 2'd3;

    reg [1:0] sync = 2'b11;
    always @(posedge i_Clock) sync <= {sync[0], i_Rx_Serial};
    wire rx = sync[1];

    reg [1:0]  state = IDLE;
    reg [15:0] cnt   = 16'd0;
    reg [2:0]  idx   = 3'd0;

    always @(posedge i_Clock) begin
        o_Rx_DV <= 1'b0;

        case (state)
            IDLE: begin
                cnt <= 16'd0;
                idx <= 3'd0;
                if (rx == 1'b0) state <= START;
            end

            START: begin
                if (cnt == (CLKS_PER_BIT - 1) / 2) begin
                    cnt   <= 16'd0;
                    state <= (rx == 1'b0) ? DATA : IDLE;
                end else cnt <= cnt + 1'b1;
            end

            DATA: begin
                if (cnt == CLKS_PER_BIT - 1) begin
                    cnt          <= 16'd0;
                    o_Rx_Byte[idx] <= rx;
                    if (idx == 3'd7) state <= STOP;
                    else             idx   <= idx + 1'b1;
                end else cnt <= cnt + 1'b1;
            end

            STOP: begin
                if (cnt == CLKS_PER_BIT - 1) begin
                    cnt     <= 16'd0;
                    o_Rx_DV <= 1'b1;
                    state   <= IDLE;
                end else cnt <= cnt + 1'b1;
            end
        endcase
    end
endmodule