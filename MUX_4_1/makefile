GHDL = ghdl
WAVE = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd))
TARGET = TB_MUX_4_1
STOP = 

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd