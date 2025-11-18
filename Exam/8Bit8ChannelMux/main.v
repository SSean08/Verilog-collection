`timescale 1ns/1ns
`include "8bit8channelmux.v"

module mux8bit_8channel_tb;

    reg [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
    wire [7:0] out;
    reg [2:0] sel;

    mux8bit_8channel mux (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, mux8bit_8channel_tb);
        // Initialize inputs
        in0 = 8'b00000001;
        in1 = 8'b00000010;
        in2 = 8'b00000100;
        in3 = 8'b00001000;
        in4 = 8'b00010000;
        in5 = 8'b00100000;
        in6 = 8'b01000000;
        in7 = 8'b10000000;

        // Test all select lines
        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;
    end

endmodule 