module debouncer #(parameter CMAX = 500_000) (
    input  wire clk,
    input  wire button_in,
    output reg  button_db = 0
);
    reg btn_ff1 = 0, btn_ff2 = 0;
    always @(posedge clk) begin
        btn_ff1 <= button_in;
        btn_ff2 <= btn_ff1;
    end

    reg [19:0] cnt = 0;
    reg clk_en = 0;
    always @(posedge clk) begin
        if (cnt == CMAX) begin   
            cnt    <= 0;
            clk_en <= 1;
        end else begin
            cnt    <= cnt + 1;
            clk_en <= 0;
        end
    end

    always @(posedge clk) begin
        if (clk_en)
            button_db <= btn_ff2;
    end
endmodule