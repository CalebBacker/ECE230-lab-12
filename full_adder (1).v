// Implement module called full_adder
module full_adder(
	input A, B, Cin,
	output Y, Cout

);

	assign Y = (!A & !B & Cin) | (!A & B & !Cin) | (A & !B & !Cin) | (A & B & Cin);
	assign Cout = (B & Cin) | (A & Cin) | (A & B);


endmodule