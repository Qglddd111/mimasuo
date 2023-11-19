`timescale 1 ns / 10 ps
module L2P_tb();
reg clk;
reg BUTTON;
wire L2P_out;
initial begin
    $dumpfile("L2P.vcd");
    $dumpvars(0,L2P_tb);
end
initial begin
    clk=0;
    BUTTON=0;
    #15
    BUTTON=1;
    #30
    BUTTON=0;
    #10
    $finish;
end
L2P u_L2P(
    .clk(clk),
    .BUTTON(BUTTON),
    .L2P_out(L2P_out)
);
always begin
    #10
    clk=~clk;
end
endmodule