module counter(
    input clk,
    input rst,
    input enable,
    input loop_mode,
    output reg [2:0] addr
);
    parameter WAIT = 50_000_000;
    reg [40:0] timer;
    reg enable_prev; 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            addr <= 0;
            timer <= 0;
            enable_prev <= 0;
        end
        else begin
            enable_prev <= enable;  

            if (loop_mode && enable) begin
                if (timer < WAIT - 1)
                    timer <= timer + 1;
                else begin
                    timer <= 0;
                    addr  <= (addr >= 3'd4) ? 3'd0 : addr + 1;
                end
            end
            else if (!loop_mode && enable && !enable_prev) begin
                if (addr < 3'd4)
                    addr <= addr + 1;
            end
            else if (!enable)
                timer <= 0;
        end
    end
endmodule