`timescale 1ns/1ns
`include "addersubtractor8bit.v"

module adder_subtractor_8bit_tb;
    reg [7:0] A, B;
    reg Op;
    wire [7:0] Sum;
    wire Cout;

    adder_subtractor_8bit uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial 
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, adder_subtractor_8bit_tb);
        A = 8'b00000000; B = 8'b00000000;  Op = 0; #10;
        A = 8'b00001111; B = 8'b00000001;  Op = 0; #10;
        A = 8'b00001111; B = 8'b00000001;  Op = 1; #10;
        A = 8'b11110000; B = 8'b00001111;  Op = 0; #10;
        A = 8'b11110000; B = 8'b00001111;  Op = 1; #10;
        A = 8'b10101010; B = 8'b01010101;  Op = 0; #10;
        A = 8'b10101010; B = 8'b01010101;  Op = 1; #10;
        A = 8'b11111111; B = 8'b00000001;  Op = 0; #10;
        A = 8'b11111111; B = 8'b00000001;  Op = 1; #10;
        
    end


endmodule