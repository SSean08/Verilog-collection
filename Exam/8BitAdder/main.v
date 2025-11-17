`timescale 1ns/1ns
`include "8bitadder.v"

module adder8bit_tb;

    reg [7:0] A, B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout; 


    // Instantiate the full adder module
    adder8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );


    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, adder8bit_tb);

        // Test some cases
        A = 8'b00000000; B = 8'b00000000; Cin = 0; #10;
        A = 8'b00000001; B = 8'b00000001; Cin = 0; #10;
        A = 8'b00000010; B = 8'b00000011; Cin = 0; #10;
        A = 8'b00000101; B = 8'b00000110; Cin = 1; #10;
        A = 8'b00001111; B = 8'b00000001; Cin = 0; #10;
        A = 8'b11111111; B = 8'b00000001; Cin = 0; #10;
        A = 8'b11111111; B = 8'b11111111; Cin = 1; #10;

    end

endmodule