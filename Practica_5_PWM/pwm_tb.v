// Miguel Alonso De La Rosa Zamora A01646106
// Con este Test Bench buscamos probar el módulo pwm.v
module pwm_tb();
    reg clk;
    reg rst_p;
    reg [7:0] pwm_in;
    wire pwm_out;
	 
    pwm #(.MIN(4), .MAX(14)) dut(
        .clk(clk),
        .rst_p(rst_p),
        .pwm_in(pwm_in),
        .pwm_out(pwm_out)
    );

    // Reloj 
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        $display("Simulacion iniciada");
        rst_p = 0; pwm_in = 0;

        // Reset
        #20; 
		  rst_p = 1; 
		  #20; 
		  rst_p = 0;

        // Prueba con 1 grado 
        pwm_in = 8'd1;
        $display("Prueba: angulo = %0d grados", pwm_in);
        #8_000_000;

        // Prueba con 180 grados
        pwm_in = 8'd180;
        $display("Prueba: angulo = %0d grados", pwm_in);
        #16_000_000;

        // Angulos aleatorios
        repeat (1) begin
            pwm_in = $urandom % 181; 
            $display("Prueba aleatoria: angulo = %0d grados", pwm_in);
				#8_000_000;		
        end

        $display("Simulacion finalizada");
        $stop;
        $finish;
    end

    initial begin
        $monitor("t=%0t | rst=%b pwm_in=%0d pwm_out=%b", $time, rst_p, pwm_in, pwm_out);
    end

    initial begin
        $dumpfile("pwm_tb.vcd");
        $dumpvars(0, pwm_tb);
    end

endmodule