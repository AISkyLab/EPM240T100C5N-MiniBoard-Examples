
//学习3 8译码器的原理，
//拨码开关的 1 2 3作为输入
//本实验采用拨码开关来作为输入，LED作为状态显示
//当然如果你的学习板没有拨码开关，可以用IO和杜邦线模拟 3个按键 作为数据输入。

module decoder_38(out,key_in);

output[7:0] out;     //3 8译码器输出有8钟状态，所以要8个LED灯。
                     //如果没有8个LED灯也没有关系，只是有的状态就看不到了
input[2:0] key_in;   //(1 2 3)key1 key2 key3 作为数据输入

reg[7:0] out;
always @(key_in)

begin
case(key_in)
                        
3'd0: out=8'b11111110;  //LED作为状态显示,低电平有效
3'd1: out=8'b11111101;
3'd2: out=8'b11111011;
3'd3: out=8'b11110111;
3'd4: out=8'b11101111;
3'd5: out=8'b11011111;
3'd6: out=8'b10111111;
3'd7: out=8'b01111111;

endcase 
end 
endmodule
