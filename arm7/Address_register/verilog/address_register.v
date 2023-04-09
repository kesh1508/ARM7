module address_register(
  input clk,
  input reset,
  input [31:0] input_address,
  output reg [31:0] output_address
);

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      output_address <= 32'b0;
    end else begin
      output_address <= input_address;
    end
  end

endmodule

