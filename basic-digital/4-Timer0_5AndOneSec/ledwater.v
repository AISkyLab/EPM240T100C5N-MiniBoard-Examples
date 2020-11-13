
//利用计数器分频
//利用分频计数器得到显示1秒和0.5的闪烁效果

module ledwater (clk_50M,led_out,f_led_out);
input   clk_50M;              //系统时钟输入50M
output  led_out;
output  f_led_out;

reg [24:0] count;  //分频计数器，25000000分频 一秒
reg [24:0] f_count;//分频计数器，12500000分频 0.5秒

reg  div_clk, f_div_clk;
reg  led_out, f_led_out;

//分频计数器。得到1秒的频率
always @ ( posedge clk_50M )
begin
if ( count==25000000 )
 begin
  div_clk<=~div_clk;
   count<=0;
  end
else
  count<=count+1;
  led_out<=~div_clk;
end

//分频计数器。得到0.5秒的频率
always @ ( posedge clk_50M )
begin
if ( f_count==12500000 )
 begin
  f_div_clk<=~f_div_clk;
   f_count<=0;
  end
else
  f_count<=f_count+1;
  f_led_out<=~f_div_clk;
end

endmodule














