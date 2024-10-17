module clockLadder
(
	input clock, clear,
	output [32:0] y,
	output PIN17
);

	logic [32:0] count;

NbitBinCount#(32) NbitBinCount
(
	.COUNT(clock) ,	// input  COUNT_sig
	.CLEAR(clear) ,	// input  CLEAR_sig
	.y(count) 				// output [N-1:0] y_sig
);

assign y = count;
assign PIN17 = count[10];

endmodule 