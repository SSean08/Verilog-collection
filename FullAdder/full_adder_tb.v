`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb;

    reg A, B, Cin; // reg in order to write values to them
    wire Sum, Cout;

    // Instantiate the full adder module
    full_adder FA(A, B, Cin, Sum, Cout);


    initial
    begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        // Test all possible input combinations
        A = 0; B = 0; Cin = 1; 
        #10;
        A = 0; B = 1; Cin = 0; 
        #10;
        A = 0; B = 1; Cin = 1; 
        #10;
        A = 1; B = 0; Cin = 0; 
        #10;
        A = 1; B = 0; Cin = 1; 
        #10;
        A = 1; B = 1; Cin = 0; 
        #10;
        A = 1; B = 1; Cin = 1; 
        #10;

        $display("Test completed");

    end

endmodule