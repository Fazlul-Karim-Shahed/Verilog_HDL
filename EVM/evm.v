
module evm(winner, result0, result1, result2, result3, s, reset);

input [1:0] s;
input reset;
output reg [31:0] result0, result1, result2, result3;
output reg [1:0] winner;


reg [1023:0] memory[3:0];
integer count, i;


initial begin

    

    count = 0;
    result0 = 32'd0;
    result1 = 32'd0;
    result2 = 32'd0;
    result3 = 32'd0;
    i = 0;
end


always @(s, reset) begin

    $monitor("Count = %d, M0 = ", count,memory[0]);

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


        $finish;
    end else begin

        case (s)
            2'b00: begin
                        memory[0][count] = 1'b1;
                        for (i = 0; i<1024 ; i=i+1) begin
                            
                                if (memory[0][i]) begin
                                    result0 = result0 + 1;
                                end

                            end
                    end

            2'b01: begin
                        memory[1][count] = 1'b1;
                        for (i = 0; i<1024 ; i=i+1) begin
                            
                                if (memory[1][i]) begin
                                    result1 = result1 + 1;
                                end

                            end
                    end

            2'b10:  begin
                        memory[2][count] = 1'b1;
                            for (i = 0; i<1024 ; i=i+1) begin
                            
                                if (memory[1][i]) begin
                                    result2 = result2 + 1;
                                end

                            end
                    end

            2'b11:  begin
                        memory[3][count] = 1'b1;
                            for (i = 0; i<1024 ; i=i+1) begin
                            
                                if (memory[1][i]) begin
                                    result3 = result3 + 1;
                                end

                            end
                    end
        endcase
        
    end

    count = count + 1;
    

end

endmodule