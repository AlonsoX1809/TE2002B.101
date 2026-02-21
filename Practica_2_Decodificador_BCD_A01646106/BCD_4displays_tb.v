// Miguel Alonso De La Rosa Zamora A01646106
// Con este Test Bench buscamos probar el módulo BCD_4displays
module BCD_4displays_tb();
	
	reg [9:0] BCD_in;
	wire [6:0] D_un, D_de, D_ce, D_mi;
	
	BCD_4displays dut(.bcd_in(BCD_in), .D_un(D_un), .D_de(D_de), .D_ce(D_ce), .D_mi(D_mi));
	initial
		begin
		$display("Simulacion iniciada");
		repeat (55) begin
			BCD_in = $random % 1024; // Se usa random para generar los posibles casos que puede tener el BCD_4displays
			#10;
		end
		$display("Simulacion finalizada");
		$stop;
		
		$finish;
		end
	
		initial
			begin
				$monitor("BCD_in = %b, D_mi = %b, D_ce = %b, D_de = %b, D_un = %b", BCD_in, D_mi, D_ce, D_de, D_un);
			end
		initial
			begin
				$dumpfile("BCD_4displays_tb.vcd");
				$dumpvars(0, BCD_4displays_tb);
			end
endmodule