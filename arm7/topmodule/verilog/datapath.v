########################################################
#work ARM7
#Author keshavek
#date 09-aprl-23
########################################################
module top_module(
  input clk,
  input reset,
  input [31:0] input_address,
  input [31:0] increment,
  input [31:0] data_in,
  input signed [31:0] multiplicand,
  input signed [31:0] multiplier,
  input [4:0] reg_addr1,
  input [4:0] reg_addr2,
  input [4:0] shift_amount,
  input [1:0] shift_type,
  input write_enable,
  input read_enable,
  output [31:0] next_address,
  output reg [31:0] output_address,
  output [31:0] data_out1,
  output [31:0] data_out2,
  output [31:0] status_reg_out,
  output [31:0] shifted_data,
  output signed [63:0] product
);

  address_incrementer incrementer(clk, reset, input_address, increment, next_address);
  address_register address_reg(clk, reset, next_address, output_address);
  barrel_shifter shifter(data_in, shift_amount, shift_type, shifted_data);
  booth_multiplier multiplier(clk, reset, multiplicand, multiplier, product);
  register_bank reg_bank(clk, reset, reg_addr1, reg_addr2, data_in, write_enable, read_enable, data_out1, data_out2, status_reg_out);

endmodule

