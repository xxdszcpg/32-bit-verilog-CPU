`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 17:49:14
// Design Name: 
// Module Name: ALU
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


module ALU(alu_in1,alu_in2,opcode,wb_data, out, rst);
input [15:0] alu_in1;
input [15:0] alu_in2;
input rst;
input [5:0] opcode;
output [15:0] wb_data;
output [7:0] out;

reg [15:0] wb_data;
reg [15:0] out;


always@(alu_in1,alu_in2,opcode,wb_data,rst)
begin
      if(rst == 0) begin
      out = 8'h00;
      wb_data = 16'h0000;
      end
      else begin
	  case(opcode)
	  6'b000000:wb_data=alu_in1+alu_in2;
	  6'b000001:
	    if(alu_in1>alu_in2||alu_in1==alu_in2) begin
	      wb_data=alu_in1-alu_in2;
	    end
	    else begin
	      wb_data=alu_in2-alu_in1;
	    end
	  6'b000010:wb_data=alu_in1*alu_in2;
	  6'b000011:wb_data=alu_in2/alu_in1;
	  6'b000100:
	    if(alu_in1>alu_in2||alu_in1==alu_in2)begin
	      wb_data=1;
	    end
	    else begin
	      wb_data=0;
	    end
	  'b000101: wb_data = alu_in1 & alu_in2;
      6'b000110: wb_data = alu_in1 | alu_in2;
      6'b000111: wb_data =  ~(alu_in1 & alu_in2);
      6'b001000: wb_data = ~(alu_in1 | alu_in2);
      6'b001001: wb_data = alu_in1 ^ alu_in2;
      6'b001010: wb_data = ~(alu_in1 ^ alu_in2);
      6'b001011: wb_data = ~ alu_in1;
      6'b001100: wb_data = ~ alu_in2;
	  default: wb_data = 16'h0000;
	  endcase
	  out = wb_data[7:0];
	  end
end
endmodule
