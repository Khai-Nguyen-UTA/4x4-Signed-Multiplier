module MultiplierSigned(
	input Clock, Reset, InQ0, InC0, Clear,
	input [3:0] Multiplier, Multiplicand,
	output [0:6] ProductDisplay,
	output [7:0] Product,
	output [3:0] CAT
);
	logic Halt;
	logic [3:0] MultiplierValue, MultiplicandValue;
	
PIPOregClass PIPOMultiplier
(
	.D(Multiplier) ,			// input [N-1:0] D_sig
	.CLK(InC0) ,				// input  CLK_sig
	.CLR(Clear) ,				// input  CLR_sig
	.Q(MultiplierValue) 		// output [N-1:0] Q_sig
);

PIPOregClass PIPOMultiplicand
(
	.D(Multiplicand) ,		// input [N-1:0] D_sig
	.CLK(InQ0) ,				// input  CLK_sig
	.CLR(Clear) ,				// input  CLR_sig
	.Q(MultiplicandValue) 	// output [N-1:0] Q_sig
);

MultiplierModelSigned MMS1
(
	.Clock(Clock) ,	// input  Clock_sig
	.Reset(Reset) ,	// input  Reset_sig
	.Multiplicand(MultiplicandValue) ,	// input [3:0] Multiplicand_sig
	.Multiplier(MultiplierValue) ,	// input [3:0] Multiplier_sig
	.Product(Product) ,	// output [7:0] Product_sig
	.Halt(Halt) 	// output  Halt_sig
);



MultiplexedDandC MultiplexedDandC_inst
(
	.HEX0(Product[3:0]) ,			// input [3:0] HEX0_sig
	.HEX1(Product[7:4]) ,			// input [3:0] HEX1_sig
	.HEX2(MultiplierValue) ,		// input [3:0] HEX2_sig
	.HEX3(MultiplicandValue) ,		// input [3:0] HEX3_sig
	.Reset(1'b1) ,						// input  Reset_sig
	.Clock(Clock) ,					// input  Clock_sig
	.SEG(ProductDisplay) ,			// output [0:6] SEG_sig
	.CAT(CAT) 							// output [3:0] CAT_sig
);

endmodule

