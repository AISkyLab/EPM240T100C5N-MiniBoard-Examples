
//学习与门的原理
//在学习板上面用按键KEY1  KEY2作为A B输入 可以IO和杜邦线模拟按键
//F输出用LED灯显示

/* AND_G2 */
module AND_G2 ( A, B, F );
	input A,B;         	// 输入端口定义
	output F;          	// 输出端口定义
	assign F = A & B;  	//如果F等于1 LED灯会亮，
						//如果F等于0 LED灯不会亮，
endmodule
