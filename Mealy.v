`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 17:53:00
// Design Name: 
// Module Name: Mealy
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
module Mealy(
    input x,
    input clk,
    input rst,
    output reg z
    );
    
    // �Ƶ�:  reg�ƶq �ݻP parameter�줸�� �ۦP
    reg [1:0] ps;   // PresentState
    reg [1:0] ns;   // NextState
    
     // A-D ���O�N��4�Ӫ��A
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    
    // Part1 
    always @(posedge clk or posedge rst)    // => clk ��0��1������ �� rst ��0��1������
        if(rst) ps <= A;    // ps ���A�]�� A
        else ps <= ns;  // ps ���A��s���U�@�Ӫ��A
        
    // Part2
    always @(ps or x)   // ps �� x ���ܤ�
        case (ps)
            A: if (x) ns = B; else ns = A;
            B: if (x) ns = B; else ns = C;
            C: if (x) ns = D; else ns = A;
            D: if (x) ns = B; else ns = C;
        endcase
        
    // Part3
    always @(ps or x)   // ps �� x ���ܤ�
        case (ps)
            A: if (x) z = 1'b0; else z = 1'b0;
            B: if (x) z = 1'b0; else z = 1'b0;
            C: if (x) z = 1'b0; else z = 1'b0;
            D: if (x) z = 1'b1; else z = 1'b0;
        endcase
endmodule