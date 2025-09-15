module half_adder (A, B, Sum, Carry);
    output Sum, Carry;
    input A, B;

    assign Sum = A ^ B;
    assign Carry = A && B;
endmodule