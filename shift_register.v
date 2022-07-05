// this register is a shift and add register
`include "RCA_4bit.v"
module shift_register( input d,input clk,input en,input rstn,input adda,output reg [7:0] out, output cout);   
assign cout=out[7];
reg [3:0] adder;
wire [3:0] sum1;
wire cout1,cout2;
wire [3:0] sum2; 
RCA_4bit RA1(out[3:0], adder,1'b0, sum1, cout1);
RCA_4bit RA2(out[7:4], adder,1'b0, sum2, cout2);
   always @ (posedge clk)
      if (!rstn)
         out <= 0;
      else begin
         if (en)begin
               
                out <= {out[6:0], d};
            
        end
                if (adda&&out[3:0]>4) begin
                 /* code */
                  adder<=4'b0011;
                  #5;
                  out[3:0]<=sum1;
                  adder<=4'b0000;

                end
                 if (adda&&out[7:4]>4) begin
                 
                  adder<=4'b0011;
                  #5;
                  out[7:4]<=sum2;
                  adder<=4'b0000;
                 end
      end
endmodule