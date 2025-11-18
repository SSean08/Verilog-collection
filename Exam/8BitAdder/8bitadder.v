`include "full_adder.v"

module adder8bit(A, B, Cin, Cout, Sum);
    input wire [7:0] A, B;
    input wire Cin;  
    output wire Cout; 
    output wire [7:0] Sum; 

    wire [6:0] C;
    full_adder FA0 (A[0], B[0], Cin,Sum[0], C[0]);
    full_adder FA1 (A[1], B[1], C[0], Sum[1], C[1]);
    full_adder FA2 (A[2], B[2], C[1], Sum [2], C[2]);
    full_adder FA3 (A[3], B[3], C[2], Sum [3], C[3]);
    full_adder FA4 (A[4], B[4], C[3], Sum [4], C[4]);
    full_adder FA5 (A[5], B[5], C[4], Sum [5], C[5]);
    full_adder FA6 (A[6], B[6], C[5], Sum [6], C[6]);
    full_adder FA7 (A[7], B[7], C[6], Sum [7], Cout);


endmodule