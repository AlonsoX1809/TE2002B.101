// Top para asignar entradas y salidas del D10-Lite al módulo debouncer
module top(
    input  MAX10_CLK1_50,   
    input  [0:0] KEY,       
    output [0:0] LEDR       
);

    debouncer WRAP(.clk(MAX10_CLK1_50),.button_in(~KEY[0]),.button_db(LEDR[0]));

endmodule