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

module multiplier_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] p
);

// Partial products
 wire [3:0] p0 = a&{4{b[0]}};
 wire [3:0] p1 = a&{4{b[1]}};
 wire [3:0] p2 = a&{4{b[2]}};
 wire [3:0] p3 = a&{4{b[3]}};

 wire [3:0] s1, s2, s3;
 wire c1, c2, c3;

// p0 + p1
 adder_4bit u_add1 (
  .a  ({1'b0, p0[3:1]}),
  .b  (p1),
  .s  (s1),
  .c (c1)
);

// (p0 + p1) + p2
 adder_4bit u_add2 (
  .a  ({c1, s1[3:1]}),
  .b  (p2),
  .s  (s2),
  .c (c2)
);

// (p0 + p1 + p2) + p3
  adder_4bit u_add3 (
   .a  ({c2, s2[3:1]}),
   .b  (p3),
   .s  (s3),
   .c (c3)
);

// Product bits
 assign p[0]   = p0[0];
 assign p[1]   = s1[0];
 assign p[2]   = s2[0];
 assign p[3]   = s3[0];
 assign p[7:4] = {c3, s3[3:1]};
 
endmodule


