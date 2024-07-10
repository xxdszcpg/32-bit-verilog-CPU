`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/08 20:47:53
// Design Name: 
// Module Name: tb_insmem
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


module tb_insmem();
reg [5:0] addr_code;
wire [31:0] code;

insmem C1(.addr_code(addr_code),.code(code));
initial begin
addr_code = 6'b000000;
#10addr_code = 6'b000001;
#10addr_code = 6'b000011;
#10addr_code = 6'b000100;
#10addr_code = 6'b000101;
#10addr_code = 6'b000110;
#10addr_code = 6'b000111;
#10addr_code = 6'b001000;
#10addr_code = 6'b001001;
#10addr_code = 6'b001010;
#10addr_code = 6'b001011;
#10addr_code = 6'b001100;

#10addr_code = 6'b001101;
#10addr_code = 6'b001110;
#10addr_code = 6'b001111;
#10addr_code = 6'b010000;
#10addr_code = 6'b010001;
#10addr_code = 6'b010010;
#10addr_code = 6'b010011;
#10addr_code = 6'b010100;
#10addr_code = 6'b010101;
#10addr_code = 6'b010110;
end
endmodule
