`timescale 1 ns / 10 ps
module mimasuo_logic_tb_new();
    reg clk;
    reg button0;
    reg button1;
    reg rst_n;
    
    wire UNLOCK;
    integer file;
    reg [1:0] data;
    initial begin
        $dumpfile("mimasuo_logic_v1.1.vcd");
        $dumpvars(0,mimasuo_logic_tb_new);
        file=$fopen("E://yanjiusheng//study//研一上//数字集成电路//密码锁//txt//test.txt","rb");
        clk=0;
        button0=0;
        button1=0;
        rst_n=0;
        #20
        rst_n=1;
        button0=0;
        button1=0;
        while (!$feof(file)) begin
            #20
            $fscanf(file, "%b", data);
            button0=data[0];
            button1=data[1];
            $display("button0: %b", button0);
            $display("button1: %b", button1);
        end
        #20
        $finish;
    end
    always begin
        #10
        clk=~clk;
    end
    mimasuo_logic u_mimasuo_logic(
        .clk(clk),
        .rst_n(rst_n),
        .button0(button0),
        .button1(button1),
        .UNLOCK(UNLOCK)
    );
endmodule
