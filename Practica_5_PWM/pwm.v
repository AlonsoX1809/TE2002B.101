// Miguel Alonso De La Rosa Zamora A01646106
// Este módulo implementa un generador de señal PWM en Verilog para controlar la posición de un servomotor (0° a 180°)
// Los parámetros MIN y MAX definen el ciclo de trabajo máximo y mínimo como percentaje de período. 
// Un divisor de reloj genera una señal de 5MHz que alimenta al contador cíclico hasta 100,000 produciendo una frecuencia de 50Hz.
// El ángulo de entrada se convierte en un ancho de pulso con límites calculador por el minimo y el maximo. 
// Un comparador evalúa en cada ciclo si el contador es menor al valor calculado, manteniendo la salida en alto durante ese tiempo y en bajo el resto.
module pwm #(parameter MIN = 4, MAX = 14) (
	input clk, rst_p,
	input [7:0] pwm_in,
	output [0:6] D_un, D_de, D_ce,
	output reg pwm_out
	);
	
	wire clk_5M_Hz;
	wire [16:0] conteo;
	reg [20:0] y;
	wire [16:0] minimo, maximo;
	wire [3:0] unidades, decenas, centenas;
	//Instanciar reloj
	clk_divider #(.FREQ(5_000_000)) DIVISOR_RELOJ(
		.clk(clk), 
		.rst(rst_p),
		.clk_div(clk_5M_Hz)
		);
	//Instanciar contador
	counter_100 #(.CMAX(100_000)) CONTADOR_100000(
		.clk(clk_5M_Hz), 
		.rst(rst_p),
		.count(conteo)
		);
	// Instaciar BCD_4displays
	assign unidades = pwm_in % 10; // Se obtienen las unidades del número. 
	assign decenas = (pwm_in % 100)/10; // Se obtienen las decenas del número.
	assign centenas = (pwm_in % 1000)/100; // Se obtienen las centenas del número.
	
	BCD_module Uni(.bcd_in(unidades), .bcd_out(D_un)); // Se instancia BCD_module para unidades. 
	BCD_module Dec(.bcd_in(decenas), .bcd_out(D_de)); // Se instancia BCD_module para decenas. 
	BCD_module Cen(.bcd_in(centenas), .bcd_out(D_ce)); // Se instancia BCD_module para centenas.
	
	//Decoder
	assign minimo = (100_000 * MIN) / 100;
	assign maximo = (100_000 * MAX) / 100;
	
	always @(*)
	begin
		y = ((maximo-minimo) * pwm_in) / 180 + minimo;
	end
	
	//Comparador
	always @(posedge clk or posedge rst_p)
	begin
	if(rst_p)
		pwm_out <= 0;
	else begin
		if (conteo < y)
			pwm_out <= 1;
		else
			pwm_out <= 0;
	end
	end
	
endmodule
	
	