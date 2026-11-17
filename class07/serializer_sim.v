`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2026 01:13:11 PM
// Design Name: 
// Module Name: serializer_sim
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



`timescale 1ns / 1ps

module serializer_sim;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire serial_out;
wire busy;
// DUT
    serializer_8bit DUT (
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in(data_in),
        .serial_out(serial_out),
        .busy(busy)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Input stimulus
    initial begin

        // Initial values
        rst     = 1;
        start   = 0;
        data_in = 8'b00000000;

        // Release reset
        #17;
        rst = 0;

        // Set input bitstring
        #3;
        data_in = 8'b10110010;

        // Start serialization
        start = 1;

        #10;
        start = 0;

        // Change input during serialization
        #26;
        data_in = 8'b01001101;

        // Wait until simulation ends
        #74;
        $finish;

    end
endmodule