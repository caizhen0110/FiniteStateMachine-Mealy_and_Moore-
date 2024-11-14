`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 17:53:00
// Design Name: 
// Module Name: Moore
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
module Moore(
    input x,
    input clk,
    input rst,
    output reg z
    );
    
    // �Ƶ�:  reg�ƶq �ݻP parameter�줸�� �ۦP
    reg[2:0] ps;    // PresentState 
    reg[2:0] ns;    // NextState   
    
    // A-E ���O�N��5�Ӫ��A
    parameter [2:0] A = 3'b000;
    parameter [2:0] B = 3'b001;
    parameter [2:0] C = 3'b010;
    parameter [2:0] D = 3'b011;
    parameter [2:0] E = 3'b100;
    
    // Part 1
    always@ (posedge clk or posedge rst)    // => clk ��0��1������ �� rst ��0��1������
        if(rst) ps <= A;    // ps ���A�]�� A
        else ps <= ns;  // ps ���A��s���U�@�Ӫ��A
        
    // Part 2
    always@(ps or x)    // ps �� x ���ܤ�
        case(ps)
            A: if(x) ns = A; else ns = B;
            B: if(x) ns = C; else ns = B;
            C: if(x) ns = A; else ns = D;
            D: if(x) ns = E; else ns = B;
            E: if(x) ns = A; else ns = D;
        endcase
        
    // Part 3
    always@(ps) // ps ���ܤ�
        case(ps)
            A: z = 1'b0;
            B: z = 1'b0;
            C: z = 1'b0;
            D: z = 1'b0;
            E: z = 1'b1;
        endcase
 
endmodule