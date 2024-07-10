module Reg_file(clk,func, imm_in, en_rg, addr, load_in, wb_data, store_in, alu_in1, alu_in2, rst);
 input clk;
 input [7:0] imm_in;
 input [1:0] func;
 input en_rg;//1 output to alu
 input rst;
 input [15:0] load_in;
 input [23:0] addr;
 input [15:0] wb_data;
 output reg [15:0] store_in;
 output reg [15:0] alu_in1;
 output reg [15:0] alu_in2;

ila_3(.clk(clk), .probe0(store_in),.probe1(load_in),.probe2(alu_in1),.probe3(alu_in2),.probe4(wb_data),.probe5(addr),.probe6(func),.probe7(en_rg));
 reg [15:0] regfile [8'b11111111:0];//immediate number register is 8'b11111111
 initial begin
 regfile[0] = 1;
 regfile[1] = 2;
 regfile[2] = 8'b10000000;
 end

always@(posedge clk)
begin
     if (rst == 0) 
      begin
     alu_in1 <= 16'h0000;
     alu_in2 <= 16'h0000;
      end
     else begin
       case(func)
         2'b00: begin
                 if(en_rg == 1) begin
                   alu_in1 <= regfile[addr[23:16]];
                   alu_in2 <= regfile[addr[15:8]];
                 end
                 else begin
                   regfile[addr[7:0]] <= wb_data;
                 end
             end
         2'b01:begin
              if(en_rg == 1) begin
                 alu_in2 <= {8'b00000000,imm_in};
                 alu_in1 <= regfile[addr[15:8]];
              end
              else  begin
                 regfile[addr[7:0]] <= wb_data;
              end
            end
         2'b10:begin
              if(en_rg == 1) begin
                 store_in <= regfile[addr[7:0]];//last 8 bits of address is for register
              end
              else begin
                   regfile[addr[7:0]] <= load_in;
                   store_in <= 16'h0000;
              end
            end
         default: begin 
            alu_in1 <= 16'h0000;
            alu_in2 <= 16'h0000;
//            store_in <= 16'h0000;//5.31
          end
        endcase
end
end

endmodule