// Miguel Alonso De La Rosa Zamora A01646106
// En este módulo lo que se busca es que a partir de un número binario de entrada (definida la cantidad de bits por el parametro N_in) 
// se pueda obtener un número decimal represetnado en los displays (también definido en los parametros N_out).
// La salida se logra gracias a que cada número se separa el número completo por su valor posicional (unidades, decenas y centenas).
// Y por ultimo se instancia el módulo BCD_module para cada uno de los valores posicionales y que se imprima en orden en los displays.  
module BCD_4displays #(parameter N_in = 10, N_out = 7)(
	input[N_in-1:0] bcd_in, 
	output[N_out-1:0] D_un, D_de, D_ce);
	
	wire [3:0] unidades, decenas, centenas;
	
	assign unidades = bcd_in % 10; // Se obtienen las unidades del número. 
	assign decenas = (bcd_in % 100)/10; // Se obtienen las decenas del número.
	assign centenas = (bcd_in % 1000)/100; // Se obtienen las centenas del número.
	
	BCD_module Uni(.bcd_in(unidades), .bcd_out(D_un)); // Se instancia BCD_module para unidades. 
	BCD_module Dec(.bcd_in(decenas), .bcd_out(D_de)); // Se instancia BCD_module para decenas. 
	BCD_module Cen(.bcd_in(centenas), .bcd_out(D_ce)); // Se instancia BCD_module para centenas. 

endmodule