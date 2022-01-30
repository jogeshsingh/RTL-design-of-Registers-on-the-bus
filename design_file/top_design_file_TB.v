`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2021 04:13:33 PM
// Design Name: 
// Module Name: top_design_file_TB
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


module top_design_file_TB(

    );
    
    reg [3:0] data_in ;
    reg clk, rst  ;
    wire [3:0] data_out , Reg1, Reg2 , Reg3 ;
    wire [1:0] state ;
    
    
    top_design_file  DUT (
 clk ,rst ,  data_in ,  data_out
 , state, Reg1, Reg2 , Reg3  );
 
 always #10 clk = ~clk ;
 initial begin
 #0 clk = 0 ; rst = 1; data_in = 0 ;
 #30 rst = 0 ; 
#20 data_in = 9 ;
#60 data_in = 7 ;
#90 data_in = 8 ;
#100 $stop ;    
 end
 
endmodule
