
module first1finder(pos, inp);

input [7:0] inp;
output reg [2:0] pos;

reg count;
integer i;

always @(*) begin
    
    count = 1;
    i = 0;
    pos = 3'b111;

    while( (i < 8) && count) begin
        if(inp[i]) begin
            count = 0;
            pos = i;
        end
        // $display("i = %d, pos = %b, count = %b, inp[i] = %b", i,pos,count,inp[i]);
        i = i + 1;
            
    end

end


endmodule