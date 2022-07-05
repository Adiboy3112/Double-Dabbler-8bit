`include "Double_Ddabbler.v"
module tb_bin2bcd;

    // Input
    reg [7:0] bin;

    reg clk;
    // Output
    wire [11:0] bcd;
    wire [7:0] reg1,reg2;
    wire [3:0] d100,d10,d1;
 
    // Extra variables


    // Instantiate the Unit Under Test (UUT)
    double_dabbler dd1(d100,d10,d1,bcd,bin,clk);
    


  initial begin
      bin <= 0;
      clk <= 0;
      $monitor ("bin=%b bcd=%b,d100=%b,d10=%b,d1=%b",bin, bcd,d100,d10,d1);

    // Use a for loop to apply random values to the input
      // for (i = 0; i < 5; i = i+1) begin
         #10 bin<=193;
         #200 $finish;
       

  

      // end
   end
       always #5 clk = ~clk;
endmodule