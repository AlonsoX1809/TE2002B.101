// Miguel Alonso De La Rosa Zamora A01646106
// Top se usa para poder asignar entradas y salidas del D10-lite del módulo pwm.v
module top(
	input MAX10_CLK1_50,
	input [0:0] KEY, 
	input [8:1] SW, 
	output [9:0] ARDUINO_IO,
	output wire [0:6] HEX0, HEX1, HEX2
	);
	
	pwm WRAP(.clk(MAX10_CLK1_50), .rst_p(~KEY[0]), .pwm_in(SW), .pwm_out(ARDUINO_IO[0]), .D_un(HEX0), .D_de(HEX1), .D_ce(HEX2));
	
endmodule
	