module register_bank(
  input clk,
  input reset,
  input [4:0] reg_addr1,
  input [4:0] reg_addr2,
  input [31:0] data_in,
  input write_enable,
  input read_enable,
  output reg [31:0] data_out1,
  output reg [31:0] data_out2,
  output reg [31:0] status_reg_out
);

  reg [31:0] registers [30:0];
  reg [31:0] status_regs [5:0];

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      for (int i = 0; i < 31; i++) begin
        registers[i] <= 32'b0;
      end
      for (int i = 0; i < 6; i++) begin
        status_regs[i] <= 32'b0;
      end
    end else begin
      if (write_enable) begin
        if (reg_addr1 != reg_addr2) begin
          registers[reg_addr1] <= data_in;
        end
        registers[reg_addr2] <= data_in;
      end
      if (read_enable) begin
        data_out1 <= registers[reg_addr1];
        data_out2 <= registers[reg_addr2];
        status_reg_out <= status_regs[reg_addr1];
      end
    end
  end

endmodule

