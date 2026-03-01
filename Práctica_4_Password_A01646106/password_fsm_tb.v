// Miguel Alonso De La Rosa Zamora A01646106
// Con este Test Bench buscamos probar el módulo password_fms.v
module password_fsm_tb();
    reg clk; 
    reg rst;
    reg next;
    reg [4:1] fsm_in; 
    wire [0:6] fsm_out_0, fsm_out_1, fsm_out_2, fsm_out_3;
    
    password_fsm DUT(.clk(clk), .rst(rst), .next(next), .fsm_in(fsm_in), 
                .fsm_out_0(fsm_out_0), .fsm_out_1(fsm_out_1), 
                .fsm_out_2(fsm_out_2), .fsm_out_3(fsm_out_3));
    
    initial
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial
    begin
        $display("simulacion iniciada");
        next = 0;
        fsm_in = 0;
        rst = 1;
        #20;
        rst = 0;

        // Digito 1
        fsm_in = 1;
        #15; next = 1;   
        #20; next = 0;   
        #20;

        // Digito 2
        fsm_in = 2;
        #15; next = 1;
        #20; next = 0;
        #20;

        // Digito 3
        fsm_in = 3;
        #15; next = 1;
        #20; next = 0;
        #20;

        // Digito 4
        fsm_in = 4;
        #15; next = 1;
        #20; next = 0;
        #20;

        #40;
        $display("simulacion finalizada");
        $stop;
    end
    
    initial
    begin
        $monitor("Entrada = %b, Salida_HEX0 = %b, Salida_HEX1 = %b, Salida_HEX2 = %b, Salida_HEX3 = %b", 
                  fsm_in, fsm_out_0, fsm_out_1, fsm_out_2, fsm_out_3);
    end
endmodule