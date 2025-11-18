`include "full_adder.v"

module adder_subtractor_8bit (A, B, Op, Sum, Cout);
    output wire [7:0] Sum;
    output wire Cout;
    input wire [7:0] A, B;
    input wire Op; // 1 = Subtraction, 0 = Addition

    wire [7:0] C; // Internal wires for carry

    full_adder FA0(A[0], B[0] ^ Op, Op ^ 1'b0, Sum[0], C[0]);
    full_adder FA1(A[1], B[1] ^ Op, C[0], Sum[1], C[1]);
    full_adder FA2(A[2], B[2] ^ Op, C[1], Sum[2], C[2]);
    full_adder FA3(A[3], B[3] ^ Op, C[2], Sum[3], C[3]);
    full_adder FA4(A[4], B[4] ^ Op, C[3], Sum[4], C[4]);
    full_adder FA5(A[5], B[5] ^ Op, C[4], Sum[5], C[5]);
    full_adder FA6(A[6], B[6] ^ Op, C[5], Sum[6], C[6]);
    full_adder FA7(A[7], B[7] ^ Op, C[6], Sum[7], C[7]);

    assign Cout = C[7] ^ Op;

endmodule



