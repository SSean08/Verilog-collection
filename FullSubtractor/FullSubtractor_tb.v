`timescale 1ns/1ns
`include "FullSubtractor.v"

module FullSubtractor_tb;

    reg A, B, Bin;
    wire Diff, Bout;

    FullSubtrator FS(A, B, Bin, Diff, Bout);

    initial
    begin
        
        $dumpfile("wave.vcd");
        $dumpvars(0, FullSubtractor_tb);
        A = 0; B = 0; Bin = 0; # 10;
        A = 0; B = 0; Bin = 1; # 10;
        A = 0; B = 1; Bin = 0; # 10;
        A = 0; B = 1; Bin = 1; # 10;
        A = 1; B = 0; Bin = 0; # 10;
        A = 1; B = 0; Bin = 1; # 10;
        A = 1; B = 1; Bin = 0; # 10;
        A = 1; B = 1; Bin = 1; # 10;

    end


endmodule