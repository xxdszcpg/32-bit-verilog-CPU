`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 22:16:13
// Design Name: 
// Module Name: tb_datamem
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


module tb_datamem();
reg [15:0] store_in;
reg [23:0] addr;
reg [1:0] en_dm;
reg clk;
wire [15:0] load_in;

datamem C1(.clk(clk),.store_in(store_in), .addr(addr), .en_dm(en_dm), .load_in(load_in));

initial
begin
	clk = 0;
	
end
always #10 clk = ~clk;
initial begin

addr = 24'b00000000_00000001_00000000;
en_dm = 2'b10;


#20addr = 24'b00000000_00000100_00000000;
en_dm = 2'b11;
store_in = 16'h0004;


#40addr = 24'b00000000_00000100_00000000;
en_dm = 2'b10;
end
endmodule