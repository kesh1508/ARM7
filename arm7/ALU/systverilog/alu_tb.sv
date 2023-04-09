#######################################################################################
#author : keshave
#work   : ARM7
#date   : 1-aprl-23

#######################################################################################
`timescale 1ns/1ns
module alu_k_tb;
//inputs
logic [31:0] a, b;
logic [31:0] opcode;

//outputs
logic [31:0] out;

//instantiate the dut

alu dut (
	.a(a),
	.b(b),
	.opcode(opcode),
	.out(out)
);

  //test case 1: add
initial begin 
	a = 32'h00000001;
	b = 32'h00000002;
	opcode = 4'b0000;
	#10;
	if (out !== 32'h00000003) $error("test case 1 failed");
end
 // Test case 2: SUBTRACT operation
    initial begin
        a = 32'h00000005;
        b = 32'h00000002;
        opcode = 4'b0001;
        #10;
        if (out !== 32'h00000003) $error("Test case 2 failed");
    end

    // Test case 3: AND operation
    initial begin
        a = 32'h00000003;
        b = 32'h0000000f;
        opcode = 4'b0010;
        #10;
        if (out !== 32'h00000003) $error("Test case 3 failed");
    end

    // Test case 4: OR operation
    initial begin
        a = 32'h00000003;
        b = 32'h0000000f;
        opcode = 4'b0011;
        #10;
        if (out !== 32'h0000000f) $error("Test case 4 failed");
    end

    // Test case 5: XOR operation
    initial begin
        a = 32'h00000003;
        b = 32'h0000000f;
        opcode = 4'b0100;
        #10;
        if (out !== 32'h0000000c) $error("Test case 5 failed");
    end

    // Test case 6: ADD WITH CARRY operation
    initial begin
        a = 32'hffffffff;
        b = 32'h00000001;
        opcode = 4'b0110;
        #10;
        if (out !== 32'h00000000) $error("Test case 6 failed");
    end

    // Test case 7: SUBTRACT WITH BORROW operation
    initial begin
        a = 32'h00000001;
        b = 32'h00000002;
        opcode = 4'b0111;
        #10;
        if (out !== 32'hffffffff) $error("Test case 7 failed");
    end

    // Test case 8: LEFT SHIFT operation
    initial begin
        a = 32'h00000001;
        b = 5;
        opcode = 4'b1000;
        #10;
        if (out !== 32'h00000020) $error("Test case 8 failed");
    end

    // Test case 9: RIGHT SHIFT operation
    initial begin
        a = 32'h00000020;
        b = 5;
        opcode = 4'b1001;
        #10;
        if (out !== 32'h00000004) $error("Test case 9 failed");
    end
   // Test case 10: unsigned right shift operation
    initial begin
        a = 32'hABCDEFFF;
        b = 5;
        opcode = 4'b1010;
        #10;
        if (out !== {27'h05F3783E}) $error("Test case 10 failed");
      
    end

   
    // Test case 11: Not Operation
    initial begin
	    a = 32'habcdef00;
	    b = 32'h0;
	    opcode = 4'b1011;
            #10;
	    if (out !== 32'h543210ff) $error("Test case 11 failed");
    end
end module

