module parity64(A, isEven);
    input wire [63:0] A;
    output wire isEven;

    assign isEven = ~(A & 1'b1);
endmodule