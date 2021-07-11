GHDL = ghdl
WAVE = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd)) ../FullAdder_1/FullAdder_1.vhd ../D_FF/D_FF.vhd
TARGET = TB_SerialAdder
STOP = --stop-time=20ns

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd