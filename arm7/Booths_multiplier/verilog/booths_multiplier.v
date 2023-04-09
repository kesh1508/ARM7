module booth_multiplier(
  input clk,
  input reset,
  input signed [31:0] multiplicand,
  input signed [31:0] multiplier,
  output signed [63:0] product
);

  reg signed [31:0] A;
  reg signed [31:0] S;

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      A <= 32'b0;
      S <= {multiplier[31], multiplier};
    end else begin
      if (S[0] && !S[1]) begin
        A <= A + multiplicand;
      end else if (!S[0] && S[1]) begin
        A <= A - multiplicand;
      end
      S <= {S[30:0], S[31]};
    end
  end

  assign product = {A, S};

endmodule

