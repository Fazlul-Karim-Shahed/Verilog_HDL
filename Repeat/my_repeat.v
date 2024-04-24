
module my_repeat;

integer x;

initial begin

    x = 0;
    repeat(10)
    begin
        $display("x = %d", x);
        x = x + 1;
    end
    
end



endmodule