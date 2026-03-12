// Miguel Alonso De La Rosa Zamora
// Este módulo es un contador ascendente, limitado por el valor de parámetro de modulo.
// El contador se usa en PWM para limitar y generar la salida PWM dentro lo que buscado por nuestra frecuencia y la frecuencia interna del reloj.
// Nuestra frecuencia: 5 MHz 
// Frecuencia interna del reloj: 50 MHz
// Límite de contador se define por: (50 MHz)/(5 MHz) = 100_000
module counter_100 #(parameter CMAX=100000) (
	input clk,
	input rst,
	output reg [16:0] count);
	
	always @(posedge clk or posedge rst)
		if(rst)
			count <= 4'b0;
		else
		begin
			if(count >= CMAX)
				count <= 0;
			else
			count <= count + 1;
		end
endmodule