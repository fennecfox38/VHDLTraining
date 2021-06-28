GHDL = ghdl
SIMUL = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd))
TARGET = TestBench

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd

simulate: $(TARGET).vcd
	$(SIMUL) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd