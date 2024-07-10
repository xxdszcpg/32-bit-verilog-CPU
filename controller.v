module controller(clk, code, en_dm, addr, imm_in, en_rg, rst, opcode, enable, en_pc,func);
input clk;
input enable;
input [31:0] code;
output [1:0] en_dm;//00 is clear, 01 is do nothing, 10 is load , 11 is store
output [23:0] addr;
output [7:0] imm_in;
output en_rg;
output [1:0] func;
output [1:0] en_pc;//00 is clear, 01 is do nothing, 10 is output address, 11 is address plus 1
output rst;
output [5:0] opcode;
reg [1:0] en_dm;
reg [23:0] addr;
reg [1:0] en_pc;
reg [1:0] func;
reg [7:0] imm_in;
reg en_rg;
reg rst;
reg [5:0] opcode;
reg [2:0] state;
reg [2:0] next_state;
reg [31:0] judge;
parameter  IF = 3'b000, EX = 3'b001,WB = 3'b010, ME = 3'b011,WB_M = 3'b100;


always@(*) begin
case(state) 
 IF: begin
  if(code[1] == 0) begin
  next_state = EX;
  end
  else if(code[3:1] == 3'b101) begin
  next_state = EX;
  end
  else if(code[1] == 1) begin
  next_state = ME;
  end
 end
 EX: begin
 next_state = WB;
 end
 ME: begin
 if(code[2] == 1) begin
 next_state = WB_M;
 end
 else begin
 next_state = WB;
 end
 end
 WB: begin
 next_state = IF;
 end
 WB_M: begin
  next_state = IF;
 end
endcase
end

always@(posedge clk) begin
if(enable) begin
 state <= next_state;
end
else begin
state <= IF;
end 
end

always@(*) begin
 if(!enable) begin
  en_dm = 2'b00;
  addr = 24'h000000;
  rst = 0;
  en_pc = 2'b01;
 end
 else begin
 if (state == EX) begin
      rst = 1;
      case(code[1:0]) 
          2'b00:begin
          func = 2'b00;
          en_rg = 1;
          addr = code[31:8];
          opcode = code[7:2];
          end
          
          2'b01:begin
          func = 2'b01;
          imm_in = code[31:24];
          addr = code[31:8];
          en_rg = 1;
          opcode = code[7:2];
          end
          
          2'b10:begin
//          if(code[7:2] == 6'b000010) begin
           func = 2'b01;
           imm_in = 8'h00;
           addr = code[31:8];
           en_rg = 1;
           opcode = 6'b000000;
//           end
          end
          endcase
     end
 else if (state == ME) begin
          rst = 1;
          if (code[1:0] == 2'b10)
          begin       
           case(code[7:2])
           6'b000000: begin
           en_dm = 2'b11;
           func = 2'b10;
            addr = code[31:8];
           end
           
           6'b000001: begin
           func = 2'b10;
            en_dm = 2'b10;//changed at 5.28 oringin 10
            en_rg = 1;
            addr = code[31:8];
           end
           
          
           endcase
       end   
 end
 else if(state == IF) begin
      rst = 1;
//      en_dm = 2'b00;//5.31
      en_pc = 2'b10;
      
 end
 else if(state == WB) begin
          en_rg = 0;
          en_pc = 2'b11;//get next code
         
 end 
 
 else if(state == WB_M) begin
//          en_rg = 1;
          en_pc = 2'b11;//get next code
 end
 end
end
endmodule
