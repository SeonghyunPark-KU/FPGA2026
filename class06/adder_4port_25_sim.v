`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 06:02:31 PM
// Design Name: 
// Module Name: adder_4port_25_sim
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

module adder_4port_25_sim(
    input wire clk 
);

//MMCM
 wire clk25;
 wire locked;

clk_wiz_0 u_mmcm (
 .clk_in1  (clk),
 .clk_out1 (clk25),
 .locked   (locked)
);

    // ---------------- Address counter ----------------
    reg [7:0] addr   = 8'd0;
    reg [7:0] addr_d = 8'd0;    // BRAM read latency(1 clk) 보정: 데이터와 정렬된 주소

    always @(posedge clk25) begin
        if (locked)
            addr <= addr + 8'd1;     // 0~255 반복
        addr_d <= addr;
    end

wire [7:0] d1, d2, d3, d4;

bram_1 u_bram1 (.clka(clk25), .addra(addr), .douta(d1));
bram_2 u_bram2 (.clka(clk25), .addra(addr), .douta(d2));
bram_3 u_bram3 (.clka(clk25), .addra(addr), .douta(d3));
bram_4 u_bram4 (.clka(clk25), .addra(addr), .douta(d4));

wire [9:0] sum;
adder_4port_25 u_adder (
 .in1 (d1),
 .in2 (d2),
 .in3 (d3),
 .in4 (d4),
 .sum (sum)
);

//ILA
ila_0 u_ila (
 .clk    (clk25),
 .probe0 (addr_d),
 .probe1 (d1),    
 .probe2 (d2),    
 .probe3 (d3),    
 .probe4 (d4),    
 .probe5 (sum)     
);

endmodule
