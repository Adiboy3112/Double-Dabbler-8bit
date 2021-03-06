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
  wire cout1,cout2;

  shift_register SR1(cout,clk,en,rst,adda,reg1,cout1);
  shift_register SR2(cout1,clk,en,rst,adda,reg2,cout2);
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
                 
                  repeat (1) @ (posedge clk)adda<=!(i[0]&i[1]&i[2]);
              
                en<=0;


                  #10 adda<=0;
              
              end
      
          
            
        end 
           
                
endmodule

