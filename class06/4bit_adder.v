`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 03:53:53 PM
// Design Name: 
// Module Name: equiv_hard
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

module half_adder(
input wire a,
input wire b,
output wire s,
output wire c
);
assign s = a^b;
assign c = a&b;

endmodule

module full_adder(
input wire a,
input wire b,
input wire cin,
output wire s,
output wire cout
);

assign s = a^b^cin;
assign cout = (a&b)|((a^b)&cin);

endmodule

module adder_4bit(
 input wire [3:0] a,
 input wire [3:0] b,
 output wire [3:0] s,
 output wire c
);

wire c1;
wire c2;
wire c3;

half_adder u_ha0 (.a(a[0]), .b(b[0]), .s(s[0]), .c(c1));
full_adder u_fa1 (.a(a[1]), .b(b[1]), .cin(c1), .s(s[1]), .cout(c2));
full_adder u_fa2 (.a(a[2]), .b(b[2]), .cin(c2), .s(s[2]), .cout(c3));
full_adder u_fa3 (.a(a[3]), .b(b[3]), .cin(c3), .s(s[3]), .cout(c));

endmodule

