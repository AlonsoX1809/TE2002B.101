// Miguel Alonso De La Rosa Zamora A01646106
// Top se usa para poder asiganar entradas y salidas del D10-lite del modulo BCD_4displays
module top(
    input [9:0] SW,
    output [0:6] HEX0, HEX1, HEX2, HEX3
);

    BCD_4displays WRAP(.bcd_in(SW), .D_un(HEX0), .D_de(HEX1), .D_ce(HEX2), .D_mi(HEX3));

endmodule