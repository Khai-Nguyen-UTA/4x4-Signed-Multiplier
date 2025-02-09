module SevenSegmentDecoder (
    input  logic [3:0] hex,        // 4-bit binary input
    output logic [6:0] seg         // 7-segment output (active low)
);
    // Seven segment display encoding for hexadecimal digits (0-F)
    // seg[6:0] = {a, b, c, d, e, f, g}; Active low
    always_comb begin
        case (hex)
            4'h0: seg = 7'b0000001; // 0
            4'h1: seg = 7'b1001111; // 1
            4'h2: seg = 7'b0010010; // 2
            4'h3: seg = 7'b0000110; // 3
            4'h4: seg = 7'b1001100; // 4
            4'h5: seg = 7'b0100100; // 5
            4'h6: seg = 7'b0100000; // 6
            4'h7: seg = 7'b0001111; // 7
            4'h8: seg = 7'b0000000; // 8
            4'h9: seg = 7'b0000100; // 9
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b1100000; // B
            4'hC: seg = 7'b0110001; // C
            4'hD: seg = 7'b1000010; // D
            4'hE: seg = 7'b0110000; // E
            4'hF: seg = 7'b0111000; // F
            default: seg = 7'b1111111; // Blank display for invalid input
        endcase
    end
endmodule
 