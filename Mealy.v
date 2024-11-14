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
    
    // 備註:  reg數量 需與 parameter位元數 相同
    reg [1:0] ps;   // PresentState
    reg [1:0] ns;   // NextState
    
     // A-D 分別代表4個狀態
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    
    // Part1 
    always @(posedge clk or posedge rst)    // => clk 由0變1的瞬間 或 rst 由0變1的瞬間
        if(rst) ps <= A;    // ps 狀態設為 A
        else ps <= ns;  // ps 狀態更新為下一個狀態
        
    // Part2
    always @(ps or x)   // ps 或 x 有變化
        case (ps)
            A: if (x) ns = B; else ns = A;
            B: if (x) ns = B; else ns = C;
            C: if (x) ns = D; else ns = A;
            D: if (x) ns = B; else ns = C;
        endcase
        
    // Part3
    always @(ps or x)   // ps 或 x 有變化
        case (ps)
            A: if (x) z = 1'b0; else z = 1'b0;
            B: if (x) z = 1'b0; else z = 1'b0;
            C: if (x) z = 1'b0; else z = 1'b0;
            D: if (x) z = 1'b1; else z = 1'b0;
        endcase
endmodule