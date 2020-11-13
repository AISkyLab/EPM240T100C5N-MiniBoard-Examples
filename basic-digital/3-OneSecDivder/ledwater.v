
//利用计数器分频
//利用分频计数器得到显示一秒的闪烁效果

module ledwater (clk_50M,led_out);
input   clk_50M;       //系统时钟输入50M
output  led_out;    

reg [24:0] count;  //分频计数器，25000000分频
reg  div_clk;     //利用分频计数器得到显示一秒的闪烁效果
reg  led_out;

//分频计数器。得到一秒的频率
always @ ( posedge clk_50M )
begin
if ( count==25000000 )
 begin
  div_clk<=~div_clk;
   count<=0;
  end
else
  count<=count+1;
  led_out<=~div_clk;   //利用分频计数器得到显示一秒的闪烁效果
end 

endmodule














