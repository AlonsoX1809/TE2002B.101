module cronometro(
	input clk,
	input rst,
	input start,
	output [7:0] D_mili_0, D_mili_1, D_mili_2, D_seg_0, D_seg_1
);
	reg [6:0] count;
	reg [6:0] seg;
	wire [3:0] milis_0, milis_1, milis_2, seg_0, seg_1;
	wire clk_1000_Hz;
	
	clk_divider #(.FREQ(100))(
		.clk(clk),
		.rst(rst),
		.clk_div(clk_1000_Hz)
	);
		
	always @(posedge clk_1000_Hz or posedge rst)
	begin
		if(rst)
		begin
			count <= 0;
			seg <= 0;
		end
		else
		begin
			if(start && count < 100)
				count <= count + 1;
			else if (start && count == 100)
			begin
				count <= 0;
				seg <= seg + 1;
			end
		end
	end
	
	assign milis_0 = count % 10;
	assign milis_1 = (count % 100)/10; 
	assign milis_2 = (count % 1000)/100;
	assign seg_0 = seg % 10;
	assign seg_1 = (seg % 100)/10;
	
	BCD_module MILISEGUNDO_0(.bcd_in(milis_0), .bcd_out(D_mili_0));
	BCD_module MILISEGUNDI_1(.bcd_in(milis_1), .bcd_out(D_mili_1));
	BCD_module MILISEGUNDO_2(.bcd_in(milis_2), .bcd_out(D_mili_2));
	BCD_module SEGUNDO_0(.bcd_in(seg_0), .bcd_out(D_seg_0));
	BCD_module SEGUNDO_1(.bcd_in(seg_1), .bcd_out(D_seg_1));
	
endmodule
				
			