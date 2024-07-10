`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 21:14:05
// Design Name: 
// Module Name: tb_decoder_cpu
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


module tb_decoder_cpu();
reg [31:0] code;
reg en_de;
wire [23:0] addr_cpu;
wire [1:0] func_cpu;
wire [5:0] opcode_cpu;
wire [7:0] imm_cpu;

decoder_cpu C1(.addr_cpu(addr_cpu),.code(code),.func_cpu(func_cpu),.opcode_cpu(opcode_cpu),.imm_cpu(imm_cpu),.en_de(en_de));
initial begin
en_de = 0;
#20en_de = 1;
code = 32'b00000000_00000001_00000010_000000_00;
end
endmodule
