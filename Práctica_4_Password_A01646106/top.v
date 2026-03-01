// Miguel Alonso De La Rosa Zamora A01646106
// Top se usa para poder asiganar entradas y salidas del D10-lite del modulo password_fms.v
// Igualmente se busca instanciar los otros modulos para que trabajen juntos. 
module TOP(
	input MAX10_CLK1_50,
	input [1:0] KEY,
	input [4:1] SW,
	output wire [0:6] HEX0, HEX1, HEX2, HEX3 
	);
	
	// Instanciamos el modulo clk_divider para tener un reloj que opere a 5 Hz. 
	wire clk_5_Hz; 
	clk_divider #(.FREQ(5)) DIVISOR_RELOJ(
		.clk(MAX10_CLK1_50), 
		.rst(~KEY[0]),
		.clk_div(clk_5_Hz)
		);
	
	password_fsm WRAP(.clk(clk_5_Hz), .rst(~KEY[0]), .next(~KEY[1]), .fsm_in(SW), .fsm_out_0(HEX0), .fsm_out_1(HEX1), .fsm_out_2(HEX2), .fsm_out_3(HEX3));

endmodule