`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2026 04:50:39 PM
// Design Name: 
// Module Name: ex_halfadder
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


module ex_halfadder(

    );
    reg A;
    reg B;
    
    wire SUM;
    wire CARRY;
    
 Ver_halfadder uut(
 .A(A),
 .B(B),
 .SUM(SUM),
 .CARRY(CARRY)
 );  
    
// INPUT SIGNAL
initial begin

A = 0;
B = 0; 

#10;
A = 1;

#10;
A = 0;
B = 1;

#10;
A = 1;

#10;
A = 0;
B = 0;

$finish;
end

endmodule
