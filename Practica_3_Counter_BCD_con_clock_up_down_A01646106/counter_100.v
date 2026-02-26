// Miguel Alonso De La Rosa Zamora A01646106
// En este módulo es un contador ascendente-descendente, limitado con el valor de parametro de modulo, con algunas funciones especiales.
// 1.- Puedes decidir si el contador va ascendente (updown = 1) o descendente (updown = 0).
// 2.- Puedes cargarle un dato de entrada a la salida (load = 1), si no el contador sigue (load = 0);
// Todo esto se logra usando cadenas de if, else if y else. 
module counter_100 #(parameter CMAX=100) (
	input clk,
	input rst,
	input load,
	input [6:0] data_in,
	input updown,
	output reg [6:0] count);
	
	always @(posedge clk or posedge rst)
		if(rst)
			count <= 4'b0;
		else if(load)
			count <= data_in;
		else if(updown)
		begin
			if(count == CMAX)
				count <= 0;
			else
				count <= count + 1;
		end
		else
		begin
			if(count == 0)
				count <= CMAX;
			else
			count <= count - 1;
		end
endmodule