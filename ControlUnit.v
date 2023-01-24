`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 17:33:52
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [2:0] funct,
    input [6:0] opcode,
    output cntl_MemWrite,
    output cntl_RegWrite,
    output cntl_Branch,
    output [2:0]sel_MemToReg,      //000: ALUResult, 001: DMemReadData_width, 010: immediate, 011: branchAddr, 100: PC + 4
    output [1:0] sel_ALUSrc,  //00: ReadData2, 01: immediate, 10: shamt
    output [1:0] sel_jump,
    output [3:0] ALUOp
    );
    
    assign {cntl_MemWrite, cntl_RegWrite, cntl_Branch, sel_jump, sel_ALUSrc, sel_MemToReg} =  (opcode == 7'b000_0011) ? {1'b0, 1'b1, 1'b0, 2'b00, 2'b01, 3'b001} : 
                                                                                    (opcode == 7'b001_0011) ? (funct == 3'b001 || funct == 3'b101) ? {1'b0, 1'b1, 1'b0, 2'b00, 2'b10, 3'b000} : {1'b0, 1'b1, 1'b0, 2'b00, 2'b01, 3'b000} : 
                                                                                    (opcode == 7'b001_0111) ? {1'b0, 1'b1, 1'b0, 2'b00, 2'bxx, 3'b011} : 
                                                                                    (opcode == 7'b010_0011) ? {1'b1, 1'b0, 1'b0, 2'b00, 2'b01, 3'bxxx} : 
                                                                                    (opcode == 7'b011_0011) ? {1'b0, 1'b1, 1'b0, 2'b00, 2'b00, 3'b000} :
                                                                                    (opcode == 7'b011_0111) ? {1'b0, 1'b1, 1'b0, 2'b00, 2'bxx, 3'b010} :
                                                                                    (opcode == 7'b110_0011) ? {1'b0, 1'b0, 1'b1, 2'b00, 2'b00, 3'b100} :
                                                                                    (opcode == 7'b110_0111) ? {1'b0, 1'b1, 1'b0, 2'b01, 2'b01, 3'b100} :
                                                                                    (opcode == 7'b110_1111) ? {1'b0, 1'b1, 1'b0, 2'b10, 2'bxx, 3'b100} : 6'bxx_xxxx;
    
    assign ALUOp =  (opcode == 7'b000_0011) ? 4'b0000 : 
                    (opcode == 7'b001_0011) ? 4'b0001 : 
                    (opcode == 7'b001_0111) ? 4'b0010 : 
                    (opcode == 7'b010_0011) ? 4'b0011 : 
                    (opcode == 7'b011_0011) ? 4'b0100 :
                    (opcode == 7'b011_0111) ? 4'b0101 :
                    (opcode == 7'b110_0011) ? 4'b0110 :
                    (opcode == 7'b110_0111) ? 4'b0111 :
                    (opcode == 7'b110_1111) ? 4'b1000 : 4'bxxxx;
    
endmodule