
module top_first1finder;

wire [2:0] POS;
reg [7:0] INP;

first1finder first1finder1(.pos(POS), .inp(INP));

initial begin
    $monitor("INP = %b, POS = %d", INP, POS);
    INP = 8'b00000100;
    #10 INP = 8'b00000001;
    #10 INP = 8'b00010000;

end

endmodule