`include "Full_Adder.v"
module RCA_4bit(A, B, cin, S, cout);
 input[3:0] A, B;
 input cin;
 output[3:0] S;
 output cout;

 wire c1, c2, c3;
 // 4 instantiated 1-bit full adders
 Full_Adder fa0 (A[0], B[0], cin, c1, S[0]);
 Full_Adder fa1 (A[1], B[1], c1, c2, S[1]);
 Full_Adder fa2 (A[2], B[2], c2, c3, S[2]);
 Full_Adder fa3 (A[3], B[3], c3, cout, S[3]);
endmodule



// module top();
//   reg [3:0] a;
//   reg [3:0] b;
//   reg cin;
//   wire cout;
//   wire [3:0] sum;

//   // 2. Instantiate the design and connect to testbench variables
//   RCA_4bit RCA1(a,b,cin,sum,cout);
//   // 3. Provide stimulus to test the design
//    initial begin
//       a <= 0;
//       b <= 0;
//       cin<=0;

      
//       $monitor ("a=%b b=%b sum=%b", a, b, sum);

//     // Use a for loop to apply random values to the input
//       // for (i = 0; i < 5; i = i+1) begin
//          #10 a <= 1;
//              b <= 2;    
//       // end
//    end

// endmodule