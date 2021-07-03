GHDL = ghdl
WAVE = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd))
TARGET = TB_Decoder_3_8
STOP = --stop-time=80ns

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd