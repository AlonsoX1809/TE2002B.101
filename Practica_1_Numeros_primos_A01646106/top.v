// Miguel Alonso De La Rosa Zamora A01646106
// Top para poder asignar entradas y salidas del D10-lite del archivo numPrim
module top(
    input  [4:1] SW,
    output [0:0]LEDR
);

    numPrim u1 (.a(SW[1]),.b(SW[2]), .c(SW[3]), .d(SW[4]),.out(LEDR[0]));

endmodule