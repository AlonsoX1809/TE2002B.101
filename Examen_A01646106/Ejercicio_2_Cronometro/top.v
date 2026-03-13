module top(
	input MAX10_CLK1_50,
	input [1:0] SW,
	input [0:0] KEY,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4);
	
	cronometro WRAP(.clk(MAX10_CLK1_50), .rst(~KEY[0]), .start(SW[1]), .D_mili_0(HEX0), .D_mili_1(HEX1), .D_mili_2(HEX2), .D_seg_0((HEX3)), 
							.D_seg_1(HEX4));
	
endmodule
	