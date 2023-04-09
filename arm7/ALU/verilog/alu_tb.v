module alu_tb;

  // Inputs
  reg [31:0] a, b;
  reg [3:0] opcode;

  // Outputs
  wire [31:0] out;

  // Instantiate the module to be tested
  alu dut(
    .a(a),
    .b(b),
    .opcode(opcode),
    .out(out)
  );

  // Clock
  reg clk = 0;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
	  $dumpfile("alu.vcd");
	  $dumpvars(0, alu_tb);
    // Test ADD
    a = 32'h00000001;
    b = 32'h00000002;
    opcode = 4'b0000;
    #10;
    $display("ADD %h + %h = %h", a, b, out);
    if(out == 32'h00000003);

    // Test SUBTRACT
    a = 32'h00000003;
    b = 32'h00000002;
    opcode = 4'b0001;
    #10;
    $display("SUBTRACT %h - %h = %h", a, b, out);
    if(out == 32'h00000001);

    // Test AND
    a = 32'h55555555;
    b = 32'hAAAAAAAA;
    opcode = 4'b0010;
    #10;
    $display("AND %h & %h = %h", a, b, out);
    if(out == 32'h00000000);

    // Test OR
    a = 32'h55555555;
    b = 32'hAAAAAAAA;
    opcode = 4'b0011;
    #10;
    $display("OR %h | %h = %h", a, b, out);
    if(out == 32'hFFFFFFFF);

    // Test XOR
    a = 32'h55555555;
    b = 32'hAAAAAAAA;
    opcode = 4'b0100;
    #10;
    $display("XOR %h ^ %h = %h", a, b, out);
    if(out == 32'hAAAAAAAA);

    // Test LEFT SHIFT
    a = 32'h00000001;
    b = 5;
    opcode = 4'b1000;
    #10;
    $display("LEFT SHIFT %h << %d = %h", a, b, out);
    if(out == 32'h00000020);

    // Test RIGHT SHIFT
    a = 32'h00000020;
    b = 5;
    opcode = 4'b1001;
    #10;
    $display("RIGHT SHIFT %h >> %d = %h", a, b, out);
    if(out == 32'h00000004);

    // Test UNSIGNED RIGHT SHIFT
    a = 32'h80000000;
    b = 5;
    opcode = 4'b1010;
    #10;
    $display("UNSIGNED RIGHT SHIFT %h >>> %d = %h", a, b, out);
    if(out == 32'h00000010);

    // Test NOT
    a = 32'h00000001;
    opcode = 4'b1011;
    #10;
    $display("NOT ~%h = %h", a, out);
    if(out == 32'hFFFFFFFE);

    $finish;
  end

endmodule

