iverilog -o mimasuo_logic mimasuo_logic_tb.v mimasuo_logic.v L2P.v
vvp mimasuo_logic
gtkwave mimasuo_logic.vcd