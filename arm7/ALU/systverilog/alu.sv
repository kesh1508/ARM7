//###################################################################################################
//#author: keshave
//#work  : arm7
//#date  : 1-aprl-23
//###################################################################################################


module alu_k ( 
	input logic [31:0] a, 
	input logic [31:0] b, 
	input [3:0] opcode, 
	output logic [31:0] out
);

// Arithmetic operation
	always_comb begin
	   case (opcode)
		4'b0000: out = a + b;
		4'b0001: out = a - b;
		4'b0010: out = a & b;
		4'b0011: out = a | b;
		4'b0100: out = a ^ b;
		4'b0110: out = a + b; //add with carry
		4'b0111: out = a - b; //sub with borrow
		default: out = 32'd0; //invalid opcode
	   endcase
end

//logical operations
        always_comb begin
	   case (opcode)
		4'b1000: out = a << b; //left shift
		4'b1001: out = a >> b; //right shift
		4'b1010: out = a >>> b; // unsigned right shift
		4'b1011: out = ~a; // not
		default: out = 32'd0; //invalid opcode
	   endcase
end
endmodule
