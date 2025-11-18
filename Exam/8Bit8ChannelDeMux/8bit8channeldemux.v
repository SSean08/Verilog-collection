module demux8bit_8channel(
    data_in,
    sel,
    out0,
    out1,
    out2,
    out3,
    out4,
    out5,
    out6,
    out7
);
    input wire [7:0] data_in;
    input wire [2:0] sel;
    output reg [7:0] out0, out1, out2, out3, out4, out5, out6, out7;

    always @(sel)
    begin
        case (sel)
            3'd0: begin
                // Reset registers
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out0 = data_in;
            end
            3'd1: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out1 = data_in;
            end
            3'd2: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out2 = data_in;
            end
            3'd3: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out3 = data_in;
            end
            3'd4: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out4 = data_in;
            end
            3'd5: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out5 = data_in;
            end
            3'd6: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out6 = data_in;
            end
            3'd7: begin
                out0 = 8'd0; out1 = 8'd0; out2 = 8'd0; out3 = 8'd0; out4 = 8'd0; out5 = 8'd0; out6 = 8'd0; out7 = 8'd0;
                out7 = data_in;
            end
        endcase
    end


endmodule