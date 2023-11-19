`timescale 1 ns / 10 ps
module mimasuo_logic_tb();
    reg clk;
    reg button0;
    reg button1;
    reg rst_n;
    
    wire UNLOCK;
    initial begin
        $dumpfile("mimasuo_logic.vcd");
        $dumpvars(0,mimasuo_logic_tb);
    end
    always begin
        #10
        clk=~clk;
    end
    initial begin
        clk=0;
        button0=0;
        button1=0;
        rst_n=0;
        #20
        rst_n=1;
        button0=0;
        button1=0;
        #20
        button0=1;
        button1=0;
        #20
        button0=0;
        button1=0;
        #20
        button0=0;
        button1=1;
        #20
        button0=0;
        button1=0;
        #20
        button0=1;
        button1=0;
        #20
        button0=0;
        button1=0;
        #20
        button0=1;
        button1=0;
        #20
        button0=0;
        button1=1;
        #20
        $finish;
    end
    mimasuo_logic u_mimasuo_logic(
        .clk(clk),
        .rst_n(rst_n),
        .button0(button0),
        .button1(button1),
        .UNLOCK(UNLOCK)
    );
endmodule