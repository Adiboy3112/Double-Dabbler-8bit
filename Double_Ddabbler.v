`include "shift_register.v"
`include "mux.v"
`include "nibble_converter.v"



module double_dabbler(d100,d10,d1,bcd,bin,clk);
  input [7:0]bin;
  output [11:0]bcd;
  input clk;
  reg [3:0] i;
  reg d,en,rst,cout,adda;
  wire [7:0] reg1,reg2;
  output [3:0] d100,d10,d1;
  wire [3:0] extra;

  shift_register SR1(cout,clk,en,rst,adda,reg1,cout1);
  shift_register SR2(cout1,clk,en,rst,adda,reg2,cout2);
  wire cout1,cout2;
  mux20x4 m1(bcd[3:0],reg1,1'b0);
  mux20x4 m2(bcd[7:4],reg1,1'b1);
  mux20x4 m3(bcd[11:8],reg2,1'b0);  
  nibble_converter nb1(d10,d1,reg1);
  nibble_converter nb2(extra,d100,reg2);
  always @(bin)
        begin
        
          rst<=0;
          #15;
          rst<=1;
        
          
        
            for (i = 0; i < 8; i = i+1)
              begin

      
                 en<=1;
                  repeat (1) @ (posedge clk)cout<=bin[7-i];
                  repeat (1) @ (posedge clk)adda<=1;
                en<=0;


                  #10 adda<=0;
              
              end
      
          
            
        end 
           
                
endmodule

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
      $monitor ("bin=%b bcd=%b,clk=%b,d100=%b,d10=%b,d1=%b",bin, bcd, clk,d100,d10,d1);

    // Use a for loop to apply random values to the input
      // for (i = 0; i < 5; i = i+1) begin
         #10 bin<=243;
         #200 $finish;
       

  

      // end
   end
       always #5 clk = ~clk;
endmodule