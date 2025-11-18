`timescale 1ns/1ns
`include "8bit8channeldemux.v"

module demux8bit_8channel_tb;

    reg [2:0] sel;
    reg [7:0] data_input;
    wire [7:0] out0, out1, out2, out3, out4, out5, out6, out7;

    demux8bit_8channel demux (
        .data_in(data_input),
        .sel(sel),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4),
        .out5(out5),
        .out6(out6),
        .out7(out7)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, demux8bit_8channel_tb);
        // Initialize inputs
        data_input = 8'b10101010;
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