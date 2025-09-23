# Verilog-collection
Collection of verilog code gathered from experimentation and class

**Dependencies**
- iverilog
- gtkwave
- At least python 3.10

**Source code convention**
- There is a script called _script.py_ that automates compilation and signal analysis of verilog-based code.
- Create a "main.v" file which will serve as the test bench for the whole verilog code. This is what the script.py will try to find.
- Save the signal dumpfile as _"wave.vcd"_ so that _script.py_ will be able to locate it and open it with gtkwave.
- Do "python script.py h" to find the documentation for the script.

