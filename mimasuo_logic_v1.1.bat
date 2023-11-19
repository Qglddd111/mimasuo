iverilog -o mimasuo_logic_v1.1 mimasuo_logic_tb_v1.1.v mimasuo_logic.v L2P.v
vvp mimasuo_logic_v1.1
gtkwave mimasuo_logic_v1.1.vcd