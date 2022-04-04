module mux20x4(out,in,sel);
  output [3:0] out;
  input [7:0] in;
  input sel;
assign out = sel? in[7:4] : in[3:0];
endmodule // mux20x3

// module top();
//   reg [19:0] a;
//   reg [1:0] b;
//   wire [3:0] out;

//   // 2. Instantiate the design and connect to testbench variables
//   mux20x4 m1(out,a,b);
//   // 3. Provide stimulus to test the design
//    initial begin
//       a <= 0;
//       b <= 0;
      
      
//       $monitor ("a=%b b=%b out=%b", a, b, out);

//     // Use a for loop to apply random values to the input
//       // for (i = 0; i < 5; i = i+1) begin
//          #10 a <= 20'b10101101111100000000;
//              b <= 1;    
//       // end
//    end

// endmodule 