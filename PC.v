`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 14:38:50
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input reset_n,
    input [19:0] nextPC,
    output reg [19:0] currPC
    );
    
    always @ (posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            currPC <= 0;
        end
        else begin
            currPC <= nextPC;
        end
    end
    
endmodule
