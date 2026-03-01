// Miguel Alonso De La Rosa Zamora A01646106
// Este módulo logra comprobar si la contraseña que se ingresa es correcta (mostrando el mensaje "Good") o si es incorrecta (mostrando el mensaje "Bad").
// Esto se logra utilizando una máquina de estados que vaya avanzando al siguiente estado si el digito que se ingresa en la entrada coincide con la contraseña. 
// En caso de que un digito ingresado no coincida con el valor y posición, directamente manda al estado Bad. Si todo esta bien es estado Good. 
module password_fsm(
	input clk, rst,
	input next,
	input [4:1] fsm_in, 
	output reg [0:6] fsm_out_0, fsm_out_1, fsm_out_2, fsm_out_3
	);
	
	// Registro de estados
	reg [2:0] state;
	reg past_next;
	reg [3:0] D0, D1, D2, D3;
	wire next_pulse = (next) & (~past_next);
	// Instanciamos modulo BCD
	wire [0:6] seg0, seg1, seg2, seg3;
	BCD_module BCD0 (.bcd_in(D0), .bcd_out(seg0));
	BCD_module BCD1 (.bcd_in(D1), .bcd_out(seg1));
	BCD_module BCD2 (.bcd_in(D2), .bcd_out(seg2));
	BCD_module BCD3 (.bcd_in(D3), .bcd_out(seg3));
	// Definimos los estados
	parameter IDLE= 0, S0 = 1, S1 = 2, S2 = 3, BAD = 4, GOOD = 5;
	parameter [3:0] password0 = 4'h1, 
						 password1 = 4'h2,
						 password2 = 4'h3,
						 password3 = 4'h4;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			past_next <= 0;
		else
			past_next <= next;
	end
	
	// State Machine 
	always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin
			state <= IDLE;
			D0 <= 0;
			D1 <= 0;
			D2 <= 0;
			D3 <= 0;
		end
		else
		begin
			case(state)
				IDLE: 
				begin
					if(next_pulse) 
					begin
						D0 <= fsm_in;
						if (fsm_in == password0)
							state <= S0;
						else
							state <= BAD;
					end
				end
				S0:
				begin
					if (next_pulse)
					begin
						D1 <= fsm_in;
						if (fsm_in == password1)
							state <= S1;
						else
							state <= BAD;
					end
				end
				S1:
				begin
					if (next_pulse)
					begin
						D2 <= fsm_in;
						if (fsm_in == password2)
							state <= S2;
						else
							state <= BAD;
					end
				end
				S2:
				begin
					if (next_pulse)
					begin
						D3 <= fsm_in;
						if (fsm_in == password3)
							state <= GOOD;
						else
							state <= BAD;
					end
				end
				GOOD: ;
				BAD: ;
				default: state <= IDLE;
			endcase	
		end
	end
	
	// Output 
	always @(*)
	begin
		case (state)
			GOOD:
			begin
				fsm_out_3 = ~7'b1011_110; // G
				fsm_out_2 = ~7'b0011_101; // O
				fsm_out_1 = ~7'b0011_101; // O
				fsm_out_0 = ~7'b0111_101; // d
			end
			BAD:
			begin
				fsm_out_3 = ~7'b0000_000; // nada
				fsm_out_2 = ~7'b0011_111; // b  
				fsm_out_1 = ~7'b1110_111; // A
				fsm_out_0 = ~7'b0111_101; // d
			end
			default:
			begin
				fsm_out_0 = seg0;
				fsm_out_1 = seg1;
				fsm_out_2 = seg2;
				fsm_out_3 = seg3;
			end
		endcase
	end
endmodule