`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 03:23:48 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr // linear feedback shift register maybe used as random no generator
    #(parameter N = 3)(
    input clk,
    input reset_n,
    output [1:N] Q
    );
    
    reg [1:N] Q_reg, Q_next;
    wire taps;
    
    // 3 tap register

    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'd1; // LSFR shouldn't start with 0 or FFFF (it remains in that forever)
        else
            Q_reg <= Q_next;
    end
    
    // Next state logic
    always @(taps, Q_reg)
        Q_next = {taps, Q_reg[1:N - 1]};

        
    // Output logic
    assign Q = Q_reg;
    //-------------------------------------------------------------    
    // For maximum-length LSFR taps, check table 3 in the following:
    // https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
    // not any random gives the max length 
    // N = 3
    assign taps = Q_reg[3] ^ Q_reg[2];
    
    // N = 8
//    assign taps = Q_reg[8] ^ Q_reg[6] ^ Q_reg[5] ^ Q_reg[4];

        
endmodule
