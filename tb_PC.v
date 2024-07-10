`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/08 19:39:14
// Design Name: 
// Module Name: tb_PC
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


module tb_PC();
reg clk;
reg [1:0] en_pc;
wire [15:0] addr_code;

PC C1(.clk(clk), .en_pc(en_pc), .addr_code(addr_code));

initial
begin
	clk = 0;
end

always #10 clk = ~clk;

initial
begin
#20en_pc <= 2'b10;
en_pc <= 2'b11;
#20en_pc <= 2'b10;
en_pc <= 2'b11;
#20en_pc <= 2'b10;
en_pc <= 2'b11;
#20en_pc <= 2'b10;
en_pc <= 2'b11;
#20en_pc <= 2'b10;
en_pc <= 2'b11;
end
endmodule
