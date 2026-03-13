module top(
	input MAX10_CLK1_50,
	input [4:1] SW,
	input [0:1] KEY,
	output [0:6] HEX0, HEX1, HEX2, HEX3
);
	
	sumatoria WRAP(.clk(MAX10_CLK1_50), .rst(~KEY[0]), .num_input(SW), .start(~KEY[1]), .D_un(HEX0), .D_de(HEX1), .D_ce(HEX2), .D_mi(HEX3));

endmodule
	