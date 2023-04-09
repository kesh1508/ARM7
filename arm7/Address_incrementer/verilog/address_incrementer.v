module address_incrementer(
  input clk,
  input reset,
  input [31:0] address,
  input [31:0] increment,
  output reg [31:0] next_address
);

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      next_address <= 32'b0;
    end else begin
      next_address <= address + increment;
    end
  end

endmodule

