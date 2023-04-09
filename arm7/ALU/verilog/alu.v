##########################################################################
#work ARM7
#Author keshave
#date 09-aprl-23
##########################################################################
module alu (
  input [31:0] a, b,
  input [3:0] opcode,
  output reg [31:0] out
);

  // Arithmetic operations
  always @* begin
    case (opcode)
      4'b0000: out = a + b; // ADD
      4'b0001: out = a - b; // SUBTRACT
      4'b0110: out = a + b; // ADD WITH CARRY
      4'b0111: out = a - b; // SUBTRACT WITH BORROW
      default: out = 32'h0; // Invalid opcode
    endcase
  end

  // Logical operations
  always @* begin
    case (opcode)
      4'b0010: out = a & b; // AND
      4'b0011: out = a | b; // OR
      4'b0100: out = a ^ b; // XOR
      4'b1000: out = a << b; // LEFT SHIFT
      4'b1001: out = a >> b; // RIGHT SHIFT
      4'b1010: out = $unsigned(a) >>> b; // UNSIGNED RIGHT SHIFT
      4'b1011: out = ~a; // NOT
      default: out = 32'h0; // Invalid opcode
    endcase
  end

endmodule

