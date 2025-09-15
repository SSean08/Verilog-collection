module full_adder_tb(Sum, Cout);
  output Sum, Cout;

  reg A, B, Cin;
  

  full_adder FA(A, B, Cin, Sum, Cout);

  initial
  begin
    A = 0; B = 0; Cin = 0; #10;
    A = 0; B = 0; Cin = 1; #10;
    A = 0; B = 1; Cin = 0; #10;
    A = 0; B = 1; Cin = 1; #10;
    A = 1; B = 0; Cin = 0; #10;
    A = 0; B = 0; Cin = 1; #10;
    A = 1; B = 1; Cin = 0; #10;
    A = 1; B = 1; Cin = 1; #10;
    $finish;
  end

endmodule