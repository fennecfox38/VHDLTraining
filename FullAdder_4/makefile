GHDL = ghdl
WAVE = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd)) ../FullAdder_1/FullAdder_1.vhd
TARGET = TB_FullAdder_4
STOP = --stop-time=32ns

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd