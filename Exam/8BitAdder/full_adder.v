module full_adder (A, B, Cin, Sum, Cout);
    output Sum, Cout;
    input A, B, Cin;

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A && B) || (B && Cin) || (Cin && A);
endmodule
    