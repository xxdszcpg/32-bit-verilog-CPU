`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 21:26:08
// Design Name: 
// Module Name: datamem
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


module datamem(store_in, addr, en_dm, load_in,clk);
input clk;
input [15:0] store_in;
input [23:0] addr;
input [1:0] en_dm;
output reg [15:0] load_in;

reg [7:0] data1 [16'h1111:0];
reg [7:0] data2 [16'h1111:0];

ila_0(.clk(clk),.probe0(en_dm),.probe1(store_in),.probe2(load_in));
initial begin
data2[0] = 8'h01;
data2[1] = 8'h02;
data1[0] = 8'h00;
data1[1] = 8'h00;
end
always@(clk) begin
 if(en_dm == 2'b10) begin
     data1[addr[15:8]] = store_in[15:8];
     data2[addr[15:8]] = store_in[7:0];
 end
end

always@(*) begin
case(en_dm)
2'b11: begin
     load_in = {data1[addr[15:8]],data2[addr[15:8]]};
     end
default: begin
     load_in = 16'h0000;
     end
endcase
end
endmodule
