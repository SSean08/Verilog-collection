module mux2(A, B, S, O);
    output O;
    input A, B, S;

    assign O = (A && S) || (B && ~S);

endmodule