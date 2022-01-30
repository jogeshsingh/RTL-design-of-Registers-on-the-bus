`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2021 03:35:28 PM
// Design Name: 
// Module Name: top_design_file
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


module top_design_file(
 clk ,rst ,  data_in ,  data_out
 , state, Reg1, Reg2 , Reg3  );
 input clk , rst ;
 output [3:0] Reg1, Reg2 , Reg3 ;
 output [3:0] data_out ;
 input [3:0] data_in ;
 output [1:0] state ;
 wire ldr_1, ldr_2, ldr_3 , sel_1 ;
 wire [1:0] sel_2 ;
  data_path DATAPATH(
 clk, rst , ldr_1  , ldr_2 , ldr_3 , sel_1 ,
 sel_2  , data_in ,  data_out , Reg1 , Reg2 , Reg3 
    );  
     controller control_path(
 clk, rst , ldr_1 , ldr_2 , ldr_3 , sel_1 , sel_2 , state
    );
endmodule
