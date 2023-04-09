# Verilog source files
SRCS = alu.v alu_tb.v

# Top-level module name
TOP = alu_tb

# Icarus Verilog compiler
IV = iverilog

# VVP simulation program
VVP = vvp

# GTKWave waveform viewer
GTKWAVE = gtkwave

# Default target
all: sim

# Simulation target
sim: $(SRCS)
	$(IV) -o $(TOP).out $(SRCS)
	$(VVP) $(TOP).out

# View waveform target
wave: $(TOP).vcd
	$(GTKWAVE) $(TOP).vcd

# Clean target
clean:
	rm -f $(TOP).out $(TOP).vcd

.PHONY: all sim wave clean

