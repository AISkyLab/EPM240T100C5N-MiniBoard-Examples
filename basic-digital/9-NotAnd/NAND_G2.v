
//学习与非门的原理
//在学习板上面用按键KEY1  KEY2作为A B输入  可以IO和杜邦线模拟按键
//F输出用LED灯显示

/* NAND_G2 */
    module NAND_G2 ( A,B,F );
    input A,B;            // 输入端口定义
    output F;             // 输入端口定义
    assign F =~(A & B);   //如果A B都等于1 ;LED灯才会亮，
                          //按下A B键中的任意一个 LED都不会亮
    endmodule
