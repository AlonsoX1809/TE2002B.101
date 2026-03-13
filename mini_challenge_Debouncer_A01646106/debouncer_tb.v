// Testbench para debouncer.v
module debouncer_tb();
    
	 reg  clk;
    reg  button_in;
    wire button_db;
	 
    debouncer #(.CMAX(50)) dut (.clk(clk),.button_in(button_in),.button_db (button_db));

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        $display("Simulacion iniciada");
        button_in = 0;
        #100; 
		  
        $display("Caso 1: Presion con rebotes");
        button_in = 1; #30;
        button_in = 0; #20;   
        button_in = 1; #25;
        button_in = 0; #15;   
        button_in = 1; #20;
        button_in = 0; #10;   
        button_in = 1;        
        repeat(6) #1000;      

        $display("Caso 2: Soltar con rebotes");
        button_in = 0; #30;
        button_in = 1; #20;   
        button_in = 0; #25;
        button_in = 1; #15;   
        button_in = 0;        
        repeat(6) #1000;

        $display("Caso 3: Presion limpia");
        button_in = 1;
        repeat(6) #1000;
        button_in = 0;
        repeat(6) #1000;

        $display("Simulacion finalizada");
        $stop;
        $finish;
    end

    initial begin
        $monitor("t=%0t | button_in=%b | btn_ff1=%b | btn_ff2=%b | clk_en=%b | button_db=%b", $time, button_in, dut.btn_ff1, dut.btn_ff2, dut.clk_en, button_db);
    end

    initial begin
        $dumpfile("debouncer_tb.vcd");
        $dumpvars(0, debouncer_tb);
    end

endmodule