module PC(clk, en_pc, addr_code, clear);
input clk;
input [1:0] en_pc;
input clear;
output reg [5:0] addr_code;

reg [15:0] temp_addr;
reg [31:0] counter;
initial begin
  temp_addr <= 6'b000000;
  counter <= 32'h00000000;
end

always@(posedge clk)
begin
 if (clear == 1)
 begin
  temp_addr <= 6'b000000;
  counter <= 32'h00000000;
 end
 else begin

 case(en_pc)
  2'b01: begin
     addr_code <= addr_code;
  end
  2'b10: begin
   addr_code <= temp_addr;
  end
  2'b11: begin
   counter <= counter + 32'h00000001;
   if (counter == 32'b0000_0001_0111_1101_0111_1000_0100_0000) begin
   temp_addr <= temp_addr + 6'b000001;
   counter <= 32'h00000000;
   end

  end
  default: begin
   temp_addr <= temp_addr;
  end
   
 endcase
 addr_code <= temp_addr;
 end
end
endmodule