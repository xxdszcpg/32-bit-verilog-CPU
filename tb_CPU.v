`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 17:58:35
// Design Name: 
// Module Name: tb_CPU
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


module tb_CPU( );
reg enable;
reg clk;
reg clear;
CPU C1( .enable(enable),.clk(clk));

initial
begin
	clk = 0;
	enable = 0;
end

// Clock set up
always #20 clk = ~clk;



always begin

#40enable = 1;
clear = 0;
 end
endmodule
