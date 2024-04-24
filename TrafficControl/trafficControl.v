`define S0 3'd0
`define S1 3'd1
`define S2 3'd2
`define S3 3'd3
`define S4 3'd4
`define RED 2'd0
`define GREEN 2'd1
`define YELLOW 2'd2

module trafficControl(hwy_light, ct_light, ct_sensor, clk, reset);

    input clk, reset;
    input ct_sensor;
    output reg [1:0] hwy_light, ct_light;

    reg [2:0] state, next_state;

    initial 
    begin
        state = `S0;
        next_state = `S0;
        hwy_light = `GREEN;
        ct_light = `RED;
    end

    always @(posedge clk) 
    begin
        state = next_state;
    end

    always @(state) 
    begin

        case (state)
            `S0: begin
                hwy_light = `GREEN;
                ct_light = `RED;
            end

            `S1: begin
                hwy_light = `YELLOW;
                ct_light = `RED;
            end

            `S2: begin
                hwy_light = `RED;
                ct_light = `RED;
            end

            `S3: begin
                hwy_light = `RED;
                ct_light = `GREEN;
            end

            `S4: begin
                hwy_light = `RED;
                ct_light = `YELLOW;
            end
 
        endcase

    end


    always @(state or clk or reset) 
    begin

        if (reset) begin
            next_state = `S0;
        end

        else begin
            case (state)

                `S0: if (ct_sensor) begin
                        next_state = `S1;
                    end else begin
                        next_state = `S0;
                    end
                
                `S1: begin
                        repeat(2) @(posedge clk)
                        next_state = `S2;
                    end
                `S2: begin
                        repeat(2) @(posedge clk)
                        next_state = `S3;
                    end

                `S3: if (ct_sensor) begin
                        next_state = `S3;
                    end else begin
                        next_state = `S4;
                    end

                `S4: begin
                        repeat(2) @(posedge clk)
                        next_state = `S0;
                    end

            endcase
        end

    end



endmodule