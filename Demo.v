`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 17:53:00
// Design Name: 
// Module Name: Demo
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
module Demo(
    input rst,
    input Crystal_oscillator,   //´¹Åé¾_Àú¾¹ ¸}¦ìP17
    input clk,
    input x_mealy,
    input x_moore,
    output z_mealy,
    output z_moore
    );
    
    wire clk_New;

    // ¨¾¼u¸õ
    debounce_better_version(clk,Crystal_oscillator,clk_New);
    
    Mealy(x_mealy,clk_New,rst,z_mealy);
    Moore(x_moore,clk_New,rst,z_moore);
    
endmodule
