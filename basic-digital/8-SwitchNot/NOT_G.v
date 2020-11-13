
//在板上面用按键KEY1作为输入 
//输出用LED灯显示
module NOT_G(KEY1,led_out);

input   KEY1;
output  led_out;    

reg  led_out;

always @ (KEY1)
begin
	if ( KEY1==0 )
		begin
			led_out<=0;
		end
	else
		begin
			led_out<=1;
		end
end 

endmodule
