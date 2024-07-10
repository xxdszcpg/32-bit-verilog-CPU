`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 20:55:54
// Design Name: 
// Module Name: decoder_cpu
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


module decoder_cpu(addr_cpu,code,func_cpu,opcode_cpu,imm_cpu,en_de);
input [31:0] code;
input en_de;
output reg [23:0] addr_cpu;
output reg [1:0] func_cpu;
output reg [5:0] opcode_cpu;
output reg [7:0] imm_cpu;

always@(*)
begin
if(en_de == 1) begin
 addr_cpu = code[31:8];
 func_cpu = code[1:0];
 opcode_cpu = code[7:2];
 imm_cpu = code[31:24];
 end
else begin
 addr_cpu = addr_cpu;
 func_cpu = func_cpu;
 opcode_cpu = opcode_cpu;
 imm_cpu = imm_cpu;
end
end
endmodule
