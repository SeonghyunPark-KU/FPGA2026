module uart_tx #(parameter CLKS_PER_BIT = 104)(
    input  wire       i_Clock,
    input  wire       i_Tx_DV,
    input  wire [7:0] i_Tx_Byte,
    output wire       o_Tx_Active,
    output reg        o_Tx_Serial = 1'b1,
    output reg        o_Tx_Done   = 1'b0
);
    reg [9:0]  sh  = 10'h3FF; 
    reg [3:0]  n   = 4'd0;
    reg [15:0] cnt = 16'd0;

    assign o_Tx_Active = (n != 4'd0);

    always @(posedge i_Clock) begin
        o_Tx_Done <= 1'b0;

        if (n == 4'd0) begin
            if (i_Tx_DV) begin
                sh          <= {1'b1, i_Tx_Byte, 1'b0};
                o_Tx_Serial <= 1'b0;
                n           <= 4'd10;
                cnt         <= 16'd0;
            end
        end else if (cnt == CLKS_PER_BIT - 1) begin
            cnt         <= 16'd0;
            sh          <= {1'b1, sh[9:1]};
            o_Tx_Serial <= sh[1];
            n           <= n - 1'b1;
            if (n == 4'd1) o_Tx_Done <= 1'b1; 
        end else begin
            cnt <= cnt + 1'b1;
        end
    end
endmodule
