module mimasuo_logic(
    input clk,
    input button0,
    input button1,
    input rst_n,
    output wire UNLOCK
);
wire zero;
wire one;
//reg state1,state0;
reg [3:0] state_n,state_c;
parameter s_00=4'b0001;
parameter s_01=4'b0010;
parameter s_10=4'b0100;
parameter s_11=4'b1000;

always @(posedge clk ) begin
    if(!rst_n) begin
        state_c<=s_00;
        state_n<=s_00;
    end
    else
        state_c<=state_n;
end

assign UNLOCK=(state_c==s_10)?1'b1:1'b0;

always @(*) begin
    case(state_c)
        s_00:begin
            if({one,zero}==2'b00) state_n<=s_00;
            else if({one,zero}==2'b10) state_n<=s_00;
            else if({one,zero}==2'b01) state_n<=s_11;
            else if({one,zero}==2'b11) state_n<=s_11;
        end
        s_01:begin
            if({one,zero}==2'b00) state_n<=s_01;
            else if({one,zero}==2'b10) state_n<=s_00;
            else if({one,zero}==2'b01) state_n<=s_10;
            else if({one,zero}==2'b11) state_n<=s_10;
        end
        s_10:begin
            if({one,zero}==2'b00) state_n<=s_10;
            else if({one,zero}==2'b10) state_n<=s_01;
            else if({one,zero}==2'b01) state_n<=s_11;
            else if({one,zero}==2'b11) state_n<=s_11;
        end
        s_11:begin
            if({one,zero}==2'b00) state_n<=s_11;
            else if({one,zero}==2'b10) state_n<=s_01;
            else if({one,zero}==2'b01) state_n<=s_11;
            else if({one,zero}==2'b11) state_n<=s_11;
        end
        default: state_n <= state_c;
    endcase
end
L2P L2P_button0(
    .clk(clk),
    .BUTTON(button0),
    .L2P_out(zero)
);
L2P L2P_button1(
    .clk(clk),
    .BUTTON(button1),
    .L2P_out(one)
);

endmodule