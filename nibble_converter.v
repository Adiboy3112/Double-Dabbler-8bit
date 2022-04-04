module nibble_converter(rn,ln,c);
  input [7:0] c;
  output [3:0] rn,ln;
  assign rn=c[7:4];
  assign ln=c[3:0];
endmodule // nibble_converter

