`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/06 21:21:39
// Design Name: 
// Module Name: tb_Reg_file
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


module tb_Reg_file( );
reg clk;
reg[7:0] Imm_in;
reg [1:0] func;
reg En_Rg;//1 output to alu
reg rst;
reg [23:0] Addr;
reg [15:0] Load_in;
reg [31:0] Wb_data;
wire [15:0] Store_in;
wire [15:0] ALU_in1;
wire [15:0] ALU_in2;

Reg_file C1(.clk(clk), .Imm_in(Imm_in), .func(func), .En_Rg(En_Rg), .rst(rst), .Addr(Addr),
        .Load_in(Load_in), .Wb_data(Wb_data), .Store_in(Store_in), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2));
        
 initial
begin
	clk = 0;
end

always #10 clk = ~clk;

initial begin
     func = 2'b00;
     En_Rg = 1;
     Addr = 24'b00000000_0000001_00000010;
     rst = 1;
     
     #20func = 2'b01;
     En_Rg = 1;
     Imm_in = 16'h0001;
     Addr = 24'b00000000_0000001_00000010;
     
//     #60func = 2'b10;
//     En_Rg = 1;
//     Addr_Rg = 24'b00000000_0000001_00000010;
//     #20 En_Rg = 0;
//     Load_in = 16'h0001;
     end
endmodule
