// Miguel Alonso De La Rosa Zamora A01646106
// Con este Test Bench buscamos probar el módulo counter_100.v
module counter_100_tb();
    reg clk;
    reg rst;
    reg load;
    reg [6:0] data_in;
    reg updown;
    wire [6:0] count;

    counter_100 #(.CMAX(100)) dut(.clk(clk), .rst(rst), .load(load), .data_in(data_in), .updown(updown), .count(count));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Simulacion iniciada");
        rst = 0; load = 0; updown = 1; data_in = 0;
        // Reset
        #10; rst = 1; #10; rst = 0;

        // Cargar valor inicial
        #10; data_in = 7'd37; load = 1; #10; load = 0;

        // Conteo ascendente
        updown = 1; repeat (15) #10;

        // Conteo descendente
        updown = 0; repeat (15) #10;

        // Cargas aleatorias
        repeat (10) begin 
			data_in = $random % 100;
			load = 1; #10;
         load = 0;#20;
        end

        $display("Simulacion finalizada");
        $stop;
        $finish;
    end

    initial begin
        $monitor("t=%0t | rst=%b load=%b updown=%b data_in=%0d count=%0d", $time, rst, load, updown, data_in, count);
    end
	 
    initial begin
        $dumpfile("counter_100_tb.vcd");
        $dumpvars(0, counter_100_tb);
    end

endmodule