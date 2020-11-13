
//两个三位二进制数的加法，结果由数码管显示 
//本实验采用拨码开关来作为输入，数码管作为状态显示
//当然如果你的学习板没有拨码开关，可以用key1 key2 key3 作为数据输入。
//a0 a1 a2 对应拨码开关的 1 2 3
//b0 b1 b2 对应拨码开关的 6 7 8

module add(a,b,c,en);

input[2:0] a,b;
output[7:0] c;
reg[7:0] c;
output en;

wire[3:0] c_tmp;

assign en=0;
assign c_tmp=a+b;

always@(c_tmp)
begin
	case(c_tmp)
		4'b0000:
			c=8'b11000000;
		4'b0001:
			c=8'b11111001;
		4'b0010:
			c=8'b10100100;
		4'b0011:
			c=8'b10110000;
		4'b0100:
			c=8'b10011001;
		4'b0101:
			c=8'b10010010;
		4'b0110:
			c=8'b10000010;
		4'b0111:
			c=8'b11111000;
		4'b1000:
			c=8'b10000000;
		4'b1001:
			c=8'b10010000;
		4'b1010:
			c=8'b10001000;
		4'b1011:
			c=8'b10000011;
		4'b1100:
			c=8'b11000110;
		4'b1101:
			c=8'b10100001;
		4'b1110:
			c=8'b10000110;
		4'b1111:
			c=8'b10001110;
	 endcase
end
endmodule 