# VHDL Examples

## How to set up Development Environment

### 1. [GHDL](https://github.com/ghdl/ghdl)

**ghdl in apt repository will no longer be updated.**

Download sourcecode and build to use latest ghdl.

```sh
$ git clone https://github.com/ghdl/ghdl.git
$ sudo apt install gnat
$ cd ghdl
$ mkdir build
$ cd build
$ ../configure --prefix=/usr/local
$ make
$ sudo make install
```

### 2. [GTKWAVE](http://gtkwave.sourceforge.net/)

GTKWAVE is available in apt repository.

```sh
$ sudo apt install gtkwave
```
## How to compile and simulate

### 1. Manually

The following set of command lines is available for the project that consists of files design.vhd and testbench.vhd

```sh
$ ghdl -a design.vhd
$ ghdl -a testbench.vhd
$ ghdl -e TestBench
$ ghdl -r TestBench --vcd==TestBench.vcd
$ gtkwave TestBench.vcd
```

### 2. Bulid Automation by Makefile

Install 'make' from apt repository by executing ```sudo apt install make``` (included in the package 'build-essential')

Then, make the file named "Makefile" in the project directory and fill it as below.

```makefile
GHDL = ghdl
WAVE = gtkwave
STD = --std=08              # to use VHDL08 (Default is VHDL93)
SRCS = $(notdir $(wildcard *.vhd))
TARGET = TestBench
STOP = --stop-time=32ns     # Set time to stop (Leave it empty if unnecessary)

$(TARGET).vcd: $(SRCS)
	$(GHDL) -a $(STD) $(SRCS)
	$(GHDL) -e $(STD) $(TARGET)
	$(GHDL) -r $(STD) $(TARGET) --vcd=$(TARGET).vcd $(STOP)

wave: $(TARGET).vcd
	$(WAVE) $(TARGET).vcd

clean:
	rm *.cf $(TARGET).vcd
```

Then it can be compiled and simulated by the command ```make``` and see the simulated result by the command ```make wave```

Initialize by the command ```make clean``` if corrupted.

## Other options

### 1. VSCode

[VHDL Extension](https://marketplace.visualstudio.com/items?itemName=puorc.awesome-vhdl)
helps user to set up VHDL development environment in VSCode.

[VHDL Formatter Extension](https://marketplace.visualstudio.com/items?itemName=Vinrobot.vhdl-formatter)
makes VHDL file prettier. (formatting)

It still requires GHDL to compile and simulate ```.vhd``` file.

Simulated result (```.vcd``` file) can be openned by 
[WaveTrace Extension](https://marketplace.visualstudio.com/items?itemName=wavetrace.wavetrace)

### 2. [EDA Playground](https://www.edaplayground.com/) 

### 3. ModelSim - [Intel FPGA Edition](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html?edition=lite&s=Newest)

### 4. [Xilinx ISE](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html)
