`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 17:44:10
// Design Name: 
// Module Name: CPU
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


module CPU( enable, clk,clear,out);
input clk;
input enable;
input clear;
output reg [7:0] out;
wire [31:0] code; wire [23:0] addr; wire [7:0] out, imm_in;wire en_rg, rst, clk, enable, clear;wire [5:0] opcode; wire[1:0] en_pc,en_dm,func;
wire [15:0] alu_in1, load_in,store_in, wb_data; wire [15:0] alu_in2; wire [5:0] addr_code;

ila_1( .clk(clk),.probe0(enable), .probe1(out));
controller  C1(.clk(clk), .code(code), .en_dm(en_dm), .addr(addr), .imm_in(imm_in), .en_rg(en_rg), .rst(rst), 
                .opcode(opcode), .enable(enable), .en_pc(en_pc),.func(func));
ALU         C2(.alu_in1(alu_in1),.alu_in2(alu_in2),.opcode(opcode),.wb_data(wb_data),.out(out), .rst(rst));
Reg_file    C3(.clk(clk),.func(func), .imm_in(imm_in), .en_rg(en_rg), .addr(addr)
               , .load_in(load_in), .wb_data(wb_data), .store_in(store_in), .alu_in1(alu_in1), .alu_in2(alu_in2), .rst(rst));
PC          C4(.clk(clk), .en_pc(en_pc), .addr_code(addr_code),.clear(clear));
insmem      C5(.addr_code(addr_code),.code(code));
datamem     C6(.store_in(store_in), .addr(addr), .en_dm(en_dm), .load_in(load_in),.clk(clk));
endmodule
