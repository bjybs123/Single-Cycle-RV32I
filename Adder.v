`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 14:07:39
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:9
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(
    input [19:0] op1, 
    input [19:0] op2,
    output [19:0] result
    );
    
    assign result = op1 + op2;
    
endmodule
