module L2P(
    input clk,
    input BUTTON,
    output L2P_out
);
reg L2P_out;
output reg BUTTON_tmp;

always @(posedge clk ) begin
    BUTTON_tmp<=BUTTON;
end

always @(posedge clk ) begin
    L2P_out<=(BUTTON_tmp^BUTTON)&!BUTTON_tmp;
end
endmodule