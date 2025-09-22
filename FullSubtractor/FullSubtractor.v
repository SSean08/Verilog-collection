module FullSubtrator(A, B, Bin, Diff, Bout);
    output Diff, Bout;
    input A, B, Bin;

    assign Bout = ((~A) && (B ^ Bin) ) || (B && Bin);
    assign Diff = A ^ B ^ Bin;
endmodule
