`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 05:31:15 PM
// Design Name: 
// Module Name: Ver_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ver_counter(
  input clk_in
    );
    
// Clock buffering
wire clk_ibuf;
wire clk;

IBUFG u_ibufg(
 .I (clk_in),
 .O (clk_ibuf)
);
BUFG u_bufg(
 .I (clk_ibufg),
 .O (clk)
);

reg [22:0] counter;
reg pulse;

always @(posedge clk) begin
    if (counter == 23'd5999999) begin
        counter <= 23'd0;
        pulse <= ~pulse;
    end
    else begin
        counter <= counter + 1'b1;
    end
end

endmodule
