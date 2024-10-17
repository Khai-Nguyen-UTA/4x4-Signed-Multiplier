module four2one #(parameter N = 4)
(
	input [1:0] select, 				//declare select inputs
	input [N-1:0] D0,D1,D2,D3, 	//declare data inputs
	output logic [N-1:0] Y 			//declare data outputs
);	

	always_comb begin					//detect input change
			case ({select}) 				//derive the output
				2'b00: Y = D0;
				2'b01: Y = D1;
				2'b10: Y = D2;
				2'b11: Y = D3;
			endcase
	end
endmodule
