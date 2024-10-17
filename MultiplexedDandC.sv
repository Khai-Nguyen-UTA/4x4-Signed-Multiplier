module MultiplexedDandC(

	input [3:0] HEX0, HEX1, HEX2, HEX3,
	input Reset, Clock, Load,
	output [0:6] SEG, 
	output [3:0] CAT
);
	logic [1:0] select;
	logic [3:0] selected_HEX;
	logic [3:0] REG0, REG1, REG2, REG3;
	logic Muxrate;
	//assign LEDRs [7:0] = {HEX3, HEX2, HEX1, HEX0};
	

clockLadder clockLadder_inst
(
	.clock(Clock) ,		// input  clock_sig
	.clear(Reset) ,		// input  clear_sig
	.PIN17(Muxrate) 		// output  PIN23_sig

);

ControlMod ControlMod_inst
(
	.slow_clock(Muxrate) ,	// input  slow_clock_sig
	.reset(Reset) ,			// input  reset_sig
	.SEL(select) ,			// output [1:0] SEL_sig
	.CAT(CAT) 			// output [3:0] CAT_sig
);

//PIPOregClass PIPOregClass0
//(
//	.D(HEX0) ,	// input [N-1:0] D_sig
//	.CLK(Load) ,			// input  CLK_sig
//	.CLR(Reset) ,			// input  CLR_sig
//	.Q(REG0) 				// output [N-1:0] Q_sig
//);
//PIPOregClass PIPOregClass1
//(
//	.D(HEX1) ,	// input [N-1:0] D_sig
//	.CLK(Load) ,			// input  CLK_sig
//	.CLR(Reset) ,			// input  CLR_sig
//	.Q(REG1) 				// output [N-1:0] Q_sig
//);
//PIPOregClass PIPOregClass2
//(
//	.D(HEX2) ,	// input [N-1:0] D_sig
//	.CLK(Load) ,			// input  CLK_sig
//	.CLR(Reset) ,			// input  CLR_sig
//	.Q(REG2) 				// output [N-1:0] Q_sig
//);
//PIPOregClass PIPOregClass3
//(
//	.D(HEX3) ,	// input [N-1:0] D_sig
//	.CLK(Load) ,			// input  CLK_sig
//	.CLR(Reset) ,			// input  CLR_sig
//	.Q(REG3) 				// output [N-1:0] Q_sig
//);

four2one four2oneMUX
(
	.select(select) ,				// input [1:0] select_sig
	.D0(HEX0) ,						// input [N-1:0] D0_sig
	.D1(HEX1) ,						// input [N-1:0] D1_sig
	.D2(HEX2) ,						// input [N-1:0] D2_sig
	.D3(HEX3) ,						// input [N-1:0] D3_sig
	.Y(selected_HEX) 				// output [N-1:0] Y_sig
);

BinaryToHex BinaryToHex
(
	.BIN(selected_HEX) ,		// input [3:0] BIN_sig
	.SEV(SEG) 					// output [0:6] SEV_sig
);


endmodule 