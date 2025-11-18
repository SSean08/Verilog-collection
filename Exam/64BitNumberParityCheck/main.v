`timescale 1ns/1ns
`include "parity64bit.v"

module parity64_tb;

    reg [63:0] input_number;
    wire isEven;

    parity64 P64(input_number, isEven);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, parity64_tb);
        input_number = 64'd10; #10;
        input_number = 64'd65536; #10;
        input_number = 64'd65535; #10;
        input_number = 64'd4294967295; #10;
        input_number = 64'd4294967294; #10;
    end


endmodule