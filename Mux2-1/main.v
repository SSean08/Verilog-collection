`timescale 1ns/1ns
`include "mux2-1.v"

module mux2_tb;

    reg A, B, S;
    wire O;

    mux2 MUX2(A, B, S, O);

    initial
    begin

        $dumpfile("wave.vcd");
        $dumpvars(0, mux2_tb);

        A = 0; B = 0; S = 0; #10;
        A = 0; B = 0; S = 1; #10;
        A = 0; B = 1; S = 0; #10;
        A = 0; B = 1; S = 1; #10;
        A = 1; B = 0; S = 0; #10;
        A = 1; B = 0; S = 1; #10;
        A = 1; B = 1; S = 0; #10;
        A = 1; B = 1; S = 1; #10;
        

        
        
    end

endmodule