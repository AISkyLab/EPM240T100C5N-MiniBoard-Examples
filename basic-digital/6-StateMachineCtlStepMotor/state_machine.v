
//简单的状态机，利用状态机控制步进电机
//state0--state1--state2--state3--state4--state5--state6-state7--state0

module state_machine(clk,rst,c);

input clk,rst;    //系统时钟50M输入 从12脚输入。
output [3:0] c;   //输出控制步进电机
reg    [3:0] c;

parameter state0=3'b000,
		  state1=3'b001,
		  state2=3'b010,
		  state3=3'b011,
		  state4=3'b100,
		  state5=3'b101,
		  state6=3'b110,
		  state7=3'b111;
		
reg[2:0] state;

reg[23:0] cnt;

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		state<=state0;
		cnt<=0;
	 end
	else begin
		cnt<=cnt+1;
		if(cnt==24'hffffff) begin
			case(state)
				state0:
					state<=state1;
				state1:
					state<=state2;
				state2:
					state<=state3;
				state3:
					state<=state4;
				state4:
					state<=state5;
				state5:
					state<=state6;
				state6:
					state<=state7;
				state7:
					state<=state0;
			 endcase
		 end
	 end
end

always@(state)
begin
	case(state)
		state0:
			c=8'b0001;
		state1:
			c=8'b0100;
		state2:
			c=8'b0010;
		state3:
			c=8'b1000;
		state4:
			c=8'b0001;
		state5:
			c=8'b0100;
		state6:
			c=8'b0010;
		state7:
			c=8'b1000;
	 endcase
end

endmodule