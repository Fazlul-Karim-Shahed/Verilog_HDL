
module top_trafficControl;

wire [1:0] HWY_LIGHT, CT_LIGHT;
reg CT_SENSOR, CLOCK, RESET;


initial begin
    CLOCK = 1'b1;

    forever #10 begin
        CLOCK = ~CLOCK;
    end
end


trafficControl tc(HWY_LIGHT, CT_LIGHT, CT_SENSOR, CLOCK, RESET);

initial begin

    $monitor(" Sensor = %b, Highway = %d, Cntry = %d", CT_SENSOR,HWY_LIGHT,CT_LIGHT);

    CT_SENSOR = 1'b0;
    #100 CT_SENSOR = 1'b1;
    #100 CT_SENSOR = 1'b0;
    #100 CT_SENSOR = 1'b1;
    #100 RESET = 1'b0;
    #1000 $finish;

    
end

endmodule