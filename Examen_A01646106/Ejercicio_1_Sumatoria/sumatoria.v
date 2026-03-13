module sumatoria(
	input clk,
	input rst,
	input [3:0] num_input,
	input start,
	output [7:0] D_un, D_de, D_ce, D_mi);
	
	reg [6:0] count;
	reg [9:0] sum;
	wire [3:0] unidades, decenas, centenas, millares;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst) 
		begin
			count <= 0;
			sum <= 0;
		end
		else
		begin
			if(num_input == 0 && start)
				sum = 0;
			else if (num_input != 0)
			begin
				if (count <= num_input && start)
				begin
					sum <= sum + count;
					count <= count + 1;
				end
				else if (count == num_input && start)
				begin
					sum <= sum;
				end
			end
		end
	end
	
	assign unidades = sum % 10;
	assign decenas = (sum % 100)/10; 
	assign centenas = (sum % 1000)/100;
	assign millares = sum/1000;
	
	BCD_module Uni(.bcd_in(unidades), .bcd_out(D_un));
	BCD_module Dec(.bcd_in(decenas), .bcd_out(D_de));
	BCD_module Cen(.bcd_in(centenas), .bcd_out(D_ce));
	BCD_module Mil(.bcd_in(millares), .bcd_out(D_mi));

endmodule
				
				
		
			
			