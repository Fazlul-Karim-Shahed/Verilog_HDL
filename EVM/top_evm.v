
module top_evm;

reg [1:0] S;
reg RESET;
wire [31:0] RESULT0, RESULT1, RESULT2, RESULT3;
wire [1:0] WINNER;

evm evm1(WINNER,RESULT0, RESULT1, RESULT2, RESULT3, S,RESET);

initial begin

    $monitor(" S = %b, RESET = %b, RESULT0 = %d, RESULT1 = %d, RESULT2 = %d,RESET3 = %d, Winner = %b",S,RESET,RESULT0, RESULT1, RESULT2, RESULT3,WINNER);

    S = 2'b11;
    #2 S = 2'b11;
    #2 S = 2'b01;
    #2 S = 2'b11;
    #2 S = 2'b00;
    #2 S = 2'b10;
    #2 S = 2'b11;

    #100 RESET = 1;

end



endmodule