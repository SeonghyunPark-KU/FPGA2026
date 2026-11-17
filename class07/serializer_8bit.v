`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2026 12:55:17 PM
// Design Name: 
// Module Name: serializer_8bit
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


module serializer_8bit(
input wire clk,
input wire rst,
input wire start,
input wire [7:0] data_in,

output reg serial_out,
output reg busy
);

localparam IDLE  = 1'b0;
localparam Serializer = 1'b1;

reg state;
reg [7:0] shift_reg;
reg [2:0] count;

always @(posedge clk) begin

if (rst) begin
  state <= IDLE;
  shift_reg <= 8'b0;
  count <= 3'b0;
  serial_out <= 1'b0;
  busy <= 1'b0;
end
else begin
case (state)
  IDLE: begin
     busy <= 1'b0;
   if (start) begin
      shift_reg <= data_in;
      count <= 3'd0;
      state <= Serializer;
   end
  end

  Serializer: begin
     busy <= 1'b1;
     serial_out <= shift_reg[7];
     shift_reg <= {shift_reg[6:0], 1'b0};
   if (count == 3'd7) begin
     state <= IDLE;
     busy <= 1'b0;
   end
   else begin
     count <= count + 1'b1;
   end
  end

endcase
end
end

endmodule
