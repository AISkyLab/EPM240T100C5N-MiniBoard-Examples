
//两个3位二进制数的除法，结果（整数商）输出到数码管显示
//本实验采用拨码开关来作为输入，数码管作为状态显示
//当然如果你的学习板没有拨码开关，可以用key1 key2 key3 作为数据输入。
//a0 a1 a2 对应拨码开关的 1 2 3
//b0 b1 b2 对应拨码开关的 6 7 8

module div(a,b,c,en);

input[2:0] a,b;//a 被除数，b 除数
output[7:0] c;
reg[7:0] c;
output[7:0] en;

reg[3:0] c_tmp;//商（整数部分）
reg[2:0] temp_reg;//计算的中间结果寄存器
integer i;

assign en=0;

always@(a or b or temp_reg)
begin
	temp_reg=0;
	c_tmp=0;
	if(b==0)
		c_tmp=4'he;
	else begin
		if(a[2]>=b) begin
			c_tmp[2]=1;
			temp_reg[2]=a[2]-b;
		 end
		else begin
			c_tmp[2]=0;
			temp_reg[2]=a[2];
		 end
		if({temp_reg[2],a[1]}>=b) begin
			c_tmp[1]=1;
			temp_reg[2:1]={temp_reg[2],a[1]}-b;
		 end
		else begin
			c_tmp[1]=0;
			temp_reg[2:1]={temp_reg[2],a[1]};
		 end
		if({temp_reg[2:1],a[0]}>=b) begin
			c_tmp[0]=1;
			temp_reg=0;
		 end
		else begin
			c_tmp[0]=0;
			temp_reg=0;
		end
	 end
end
			
			
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