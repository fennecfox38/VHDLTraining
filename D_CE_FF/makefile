GHDL = ghdl
WAVE = gtkwave
STD = --std=08
SRCS = $(notdir $(wildcard *.vhd)) #../D_FF/D_FF.vhd ../Gated_DLatch/Gated_DLatch.vhd ../SRLatch/SRLatch.vhd
TARGET = TB_D_CE_FF
STOP = --stop-time=22ns

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd