module barrel_shifter(
  input [31:0] data_in,
  input [4:0] shift_amount,
  input [1:0] shift_type,
  output [31:0] data_out
);

  wire [31:0] shifted_data;

  assign shifted_data = (shift_type == 2'b00) ? data_in >> shift_amount :
                        (shift_type == 2'b01) ? data_in << shift_amount :
                        (shift_type == 2'b10) ? {shift_amount{1'b0}, data_in[31:shift_amount+1]} :
                        (shift_type == 2'b11) ? {data_in[31-shift_amount+1:0], shift_amount{1'b0}} : 32'bzzzzzzzz;

  assign data_out = shifted_data;

endmodule

