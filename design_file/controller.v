`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2021 03:25:06 PM
// Design Name: 
// Module Name: controller
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


module controller(
 clk, rst , ldr_1 , ldr_2 , ldr_3 , sel_1 ,sel_2, state
 
    );
   input clk, rst ;
   output ldr_1 , ldr_2 , ldr_3 , sel_1 ;
   output [1:0] sel_2 ;
   output reg [1:0] state ;
reg [1:0] next_state;
 reg [5:0] CV ;
    
  parameter [1:0] S0 = 0 , S1 = 1 ,  S2 = 2;
  
    always@(negedge clk )
    begin
    if ( rst)
    state <= S0 ;
    else
    state<= next_state ;
    end
    
    always @ ( state)
    begin
    case(state)
    S0 : begin CV = 6'b100100; next_state = S1 ; end
    S1 : begin CV = 6'b010000; next_state = S2 ; end
    S2 : begin CV = 6'b001001 ; next_state = S0 ; end
    default : begin CV = 6'b000000 ; next_state = S0 ; end
    endcase
    end
    
    assign ldr_1 = CV[5] ;
    assign ldr_2 = CV[4] ;
    assign ldr_3 = CV[3] ;
    assign sel_1 = CV[2] ;
     assign sel_2[1] = CV[1] ;
    assign sel_2[0] = CV[0] ;
    endmodule
    
 
