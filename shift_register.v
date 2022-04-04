// this register is a shift and add register
module shift_register( input d,input clk,input en,input rstn,input adda,output reg [7:0] out, output cout);   
assign cout=out[7];
   always @ (posedge clk)
      if (!rstn)
         out <= 0;
      else begin
         if (en)begin
               
                out <= {out[6:0], d};
            
        end
                if (adda&&out[3:0]>4) begin
                 /* code */
                  out[3:0]<=out[3:0]+3;
                end
                 if (adda&&out[7:4]>4) begin
                 /* code */
                 out[7:4]<=out[7:4]+3;
                 end
      end
endmodule