// Miguel Alonso De La Rosa Zamora A01646106
// En este modulo analizamos si un número binario, de 4 variables, es primo o no usando lógica booleana. 
module numPrim(
	input a, b, c, d, // Inicializamos entradas para las 4 variables
	output out // Inicializamos una salida
	);
	
	assign out = (c|d)&(b|c)&(~a|d)&(~b|~c|d)&(~a|~b|~c); //Ecuación booleana obtenida
	
endmodule