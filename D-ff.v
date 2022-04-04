`timescale 10us/1ns

module D_ff(clk, D, Q);
 input  clk, D;
 output Q;

 wire   clk, s0, s1, D, Q, Q_BAR; // internal nets
 
 nand U1 (s0,D,clk);   // U1: local name of the nand instance
 nand U2 (s1,s0,clk);  // U2: local name of the nand instance
 nand U3 (Q,Q_BAR,s0); // U3: local name of the nand instance
 nand U4 (Q_BAR,Q,s1); // U4: local name of the nand instance

endmodule