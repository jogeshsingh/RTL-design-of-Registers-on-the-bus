`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 01:48:59 PM
// Design Name: 
// Module Name: data_path
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_path(
 clk, rst , ldr_1  , ldr_2 , ldr_3 , sel_1 ,
 sel_2  ,  data_in ,  data_out , Reg1 , Reg2, Reg3
    );
    input clk, rst , ldr_1  , ldr_2 , ldr_3 , sel_1 ;
input [1:0] sel_2  ; 
input [3:0] data_in ; 
output reg [3:0] data_out ;
output reg [3:0] Reg1  , Reg2 , Reg3 ;
    
    
    
    always @ ( posedge clk   )
begin
if (rst)
begin
Reg1 <= 4'b0000;
end
else if ( ldr_1 )
begin
if (sel_1 )
begin
Reg1 <= data_in ;
end
else
begin
Reg1 <= data_out ;
end
end
else
begin
Reg1 <= Reg1 ;
end
end 


always @ ( posedge clk )
begin
if (rst)
begin
Reg2<= 4'b0000;
end
else if (ldr_2)
begin
Reg2 <= data_out ;
end
else
begin
Reg2 <= Reg2 ;
end
end



always @ ( posedge clk  )
begin
if (rst)
begin
Reg3<= 4'b0000;
end
else if (ldr_3)
begin
Reg3 <= data_out ;
end
else
begin
Reg3 <= Reg3 ;
end
end


always@ ( sel_2 or Reg1 or Reg2 or Reg3 )
begin
case(sel_2)
2'b00 : data_out = Reg1 ;
2'b01 : data_out = Reg2 ;
2'b10 : data_out = Reg3 ;
default : data_out = 4'b0000;
endcase
end

endmodule

    
    
    
    
    
    
    
    
  
  
   /*
    always @ (posedge clk , posedge rst)
    begin
    if (rst)
    Reg1<= 4'b0000;
    else if (ldr_1)
    if (sel_1 )
   Reg1<= data_in ;
   else
   Reg1<= data_out ;
    end 
   
    always @ ( posedge clk , posedge rst )
    begin
    if (rst)
    Reg2 <= 4'b0000;
    else if (ldr_2)
    Reg2 <= data_out ;
    end
   
   
   always@ (posedge clk , posedge rst)
   begin
   if (rst)
   Reg3<= 4'b0000;
   else if ( ldr_3)
   Reg3<= data_out ;
   end
 always @  (sel_2 or Reg1 or Reg2 or Reg3 )
 begin
 case(sel_2) 
 2'b00:  data_out = Reg1 ;
 2'b01 : data_out = Reg2 ;
 2'b10 : data_out = Reg3;
 default : data_out = 4'b0000;
 endcase
 end 
 
   
endmodule */
