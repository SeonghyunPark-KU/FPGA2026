`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 04:09:55 PM
// Design Name: 
// Module Name: halfadder_sim_rom
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


module halfadder_sim_rom(
input clk,
input reset
);

wire [1:0] bram_rom;

wire A;
wire B;
wire sum;
wire carry;

reg [1:0] add;

initial begin
  add = 2'd0;
end  

// Counter
always @(posedge clk) begin
    if (reset)
        add <= 2'd0;
    else if (add == 2'd3)
        add <= 2'd0;
    else
        add <= add + 1'b1;
end
    
// BRAM ROM
    blk_mem_gen_0 i0_bram (
        .clka(clk),
        .addra(add),
        .douta(bram_rom)
    );

assign A = bram_rom[1];
assign B = bram_rom[0];

// Halfadder
Ver_halfadder u_halfadder (
     .A(A),
     .B(B),
     .clk_in(clk),
     .reset(reset),
     .sum(sum),
     .carry(carry)
);


// ILA
ila_0 u_ila (
    .clk(clk),

    .probe0(bram_rom),
    .probe1(sum),
    .probe2(carry)
 );
    
endmodule
