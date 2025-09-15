`timescale 1ns / 1ns
`include "half_adder.v"

module half_adder_tb;
    reg A, B;
    wire Sum, Carry;

    half_adder HA(A, B, Sum, Carry);

    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
    end
endmodule