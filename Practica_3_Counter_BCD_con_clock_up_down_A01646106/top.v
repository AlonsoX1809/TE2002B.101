// Miguel Alonso De La Rosa Zamora A01646106
// Top se usa para poder asiganar entradas y salidas del D10-lite del modulo counter_100.v
// Igualmente se busca instanciar los otros modulos para que trabajen juntos. 
module top(
	input MAX10_CLK1_50,
	input [9:1] SW,
	input [1:0] KEY, 
	output [0:6] HEX0, HEX1, HEX2
);

   wire rst_a = ~KEY[0];
	wire load = ~KEY[1];
	wire updown = SW[9];
	wire clk_5_Hz;
	wire [0:6] conteo;
	 
	clk_divider #(.FREQ(5)) DIVISOR_RELOJ(
		.clk(MAX10_CLK1_50), 
		.rst(rst_a),
		.clk_div(clk_5_Hz)
		);
	counter_100 #(.CMAX(100)) CONTADOR_100(
		.clk(clk_5_Hz), 
		.rst(rst_a),
		.load(load),
		.data_in(SW[7:1]),
		.updown(updown),
		.count(conteo)
		);
	BCD_4displays #(.N_in(10), .N_out(7)) DISPLAYS(
		.bcd_in(conteo), 
		.D_un(HEX0), 
		.D_de(HEX1), 
		.D_ce(HEX2)
		);

endmodule