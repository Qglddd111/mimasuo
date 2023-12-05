# mimasuo
东南数字集成电路课程作业，基于有限状态机的密码锁设计

L2P.v文件为电平转脉冲模块，用于将按键的电平转换为宽度为1个周期的脉冲

mimasuo_logic.v为顶层文件，其中用状态机进行驱动

mimasuo_logic_tb.v为测试文件

mimasuo_logic_tb_v1.1.v中在测试过程中使用txt文件读取按键按下情况

mimasuo_logic.bat为运行脚本，运行后会调用iverilog进行编译运行，之后用gtkwave显示波形
