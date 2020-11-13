
//LED流水灯试验
//利用分频计数器得到流水灯的效果

module ledwater (clk_50M,rst,dataout);

input clk_50M,rst;     //系统时钟50M输入 从12脚输入。
output [3:0] dataout;  //我们这里用4个LED灯，

reg [3:0] dataout;
reg [26:0] count; //分频计数器

//分频计数器
always @ ( posedge clk_50M )
 begin
  count<=count+1;
 end

always @ ( posedge clk_50M or negedge rst)

 begin
  case ( count[26:25] )
  
  0: dataout<=4'b1110;
  
  1: dataout<=4'b1101;
  
  2: dataout<=4'b1011;
  
  3: dataout<=4'b0111;
  
  endcase
 end
endmodule










