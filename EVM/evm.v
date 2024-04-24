
module evm(winner, result0, result1, result2, result3, s, reset);

input [1:0] s;
input reset;
output reg [31:0] result0, result1, result2, result3;
output reg [1:0] winner;


reg [127:0] memory[3:0];
integer count, i;


initial begin

    // $monitor("Memory[0] = %b, Memory[1] = %b, Memory[2] = %b, Memory[3] = %b", memory[0], memory[1], memory[2], memory[3]);
    // $monitor("Result0 = %d, Result1 = %d, Result2 = %d, Result3 = %d", result0, result1, result2, result3);

    count = 0;
    i = 0;
end


always @(s, posedge reset) begin

    if (reset) begin

        if (result0 > result1 && result0 > result2 && result0 > result3 ) begin
            winner = 2'b00;
        end
        else if (result1 > result0 && result1 > result2 && result1 > result3 ) begin
            winner = 2'b01;
        end

         else if (result2 > result0 && result2 > result1 && result2 > result3 ) begin
            winner = 2'b10;
        end

        else if (result3 > result0 && result3 > result1 && result3 > result2 ) begin
            winner = 2'b11;
        end

    end else begin

        case (s)
            2'b00: begin
                        
                        memory[0][count] = 1;
                        result0 = 0;
                        for (i = 0; i<128 ; i=i+1) begin
                            
                                if (memory[0][i] === 1'b1) begin
                                    result0 = result0 + 1;
                                end

                            end
                        // $display("Result0 = %d", result0);
                    end

            2'b01: begin
                        
                        memory[1][count] = 1;
                        result1 = 0;
                        for (i = 0; i<128 ; i=i+1) begin
                            
                                if (memory[1][i] === 1'b1) begin
                                    // $display("Memory[1][%d] = %b", i, memory[1][i]);
                                    result1 = result1 + 1;
                                end


                            end
                        // $display("Result1 = %d", result1);

                    end

            2'b10:  begin
                        
                        memory[2][count] = 1;
                        result2 = 0;
                            for (i = 0; i<128 ; i=i+1) begin
                            
                                if (memory[2][i] === 1'b1) begin
                                    result2 = result2 + 1;
                                end

                            end
                        // $display("Result2 = %d", result2);
                    end

            2'b11:  begin
                        
                        memory[3][count] = 1;
                        result3 = 0;
                            for (i = 0; i<128 ; i=i+1) begin
                            
                                if (memory[3][i] === 1'b1) begin
                                    result3 = result3 + 1;
                                end

                            end
                        // $display("Result3 = %d", result3);
                    end
        endcase
        
    end

    count = count + 1;
    

end

endmodule