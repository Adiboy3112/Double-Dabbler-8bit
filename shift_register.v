// Code your design here
module shift_register  (  input d,                      // Declare input for data to the first flop in the shift register
                                        input clk,                    // Declare input for clock to all flops in the shift register
                                        input en,                     // Declare input for enable to switch the shift register on/off
                                        input rstn,         
                                        input adda,          // Declare input to reset the register to a default value
                                        output reg [7:0] out,
                                        output cout);    // Declare output to read out the current value of all flops in this register


   // This always block will "always" be triggered on the rising edge of clock
   // Once it enters the block, it will first check to see if reset is 0 and if yes then reset register
   // If no, then check to see if the shift register is enabled
   // If no => maintain previous output. If yes, then shift based on the requested direction

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