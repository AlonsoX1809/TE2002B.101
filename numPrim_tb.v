// Miguel Alonso De La Rosa Zamora A01646106
// En este testbench probamos el modulo de numPrim. 
module numPrim_tb();

	reg A_in, B_in, C_in, D_in;
	wire Z_out;
	
	numPrim dut(.a(A_in), .b(B_in), .c(C_in), .d(D_in), .out(Z_out));
	initial
		begin
		$display("Simulacion iniciada");
		// Estos son los casos posibles con 4 variables
		A_in = 0; B_in = 0; C_in = 0; D_in = 0; #10; //0
		A_in = 0; B_in = 0; C_in = 0; D_in = 1; #10; //1
		A_in = 0; B_in = 0; C_in = 1; D_in = 0; #10; //2
		A_in = 0; B_in = 0; C_in = 1; D_in = 1; #10; //3
		A_in = 0; B_in = 1; C_in = 0; D_in = 0; #10; //4
		A_in = 0; B_in = 1; C_in = 0; D_in = 1; #10; //5
		A_in = 0; B_in = 1; C_in = 1; D_in = 0; #10; //6
		A_in = 0; B_in = 1; C_in = 1; D_in = 1; #10; //7
		A_in = 1; B_in = 0; C_in = 0; D_in = 0; #10; //8
		A_in = 1; B_in = 0; C_in = 0; D_in = 1; #10; //9
		A_in = 1; B_in = 0; C_in = 1; D_in = 0; #10; //10
		A_in = 1; B_in = 0; C_in = 1; D_in = 1; #10; //11
		A_in = 1; B_in = 1; C_in = 0; D_in = 0; #10; //12
		A_in = 1; B_in = 1; C_in = 0; D_in = 1; #10; //13
		A_in = 1; B_in = 1; C_in = 1; D_in = 0; #10; //14
		A_in = 1; B_in = 1; C_in = 1; D_in = 1; #10; //15
		$display("Simulacion finalizada");
		$stop;
		
		$finish;
		end
	
		initial
			begin
				$monitor("A_in = %b, B_in = %b, C_in = %b, D_in = %b,Z_out = %b", A_in, B_in, C_in, D_in, Z_out);
			end
		initial
			begin
				$dumpfile("numPrim_tb.vcd");
				$dumpvars(0, numPrim_tb);
			end
endmodule