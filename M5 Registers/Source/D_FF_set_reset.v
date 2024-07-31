`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:50:46 AM
// Design Name: 
// Module Name: D_FF_set_reset
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


module D_FF_set_reset(
    input clk,
    input D,
    input reset_n, // active lo
    input set_n,
    output Q
    );
    
    reg Q_reg, Q_next; // declare registers
    
    // Asynchronous reset
    always @(negedge clk, negedge reset_n) 
    begin
        Q_reg <= Q_reg; // default (optional)
        if (!reset_n) 
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next; // clk changed not reset
            // register part 
    end
    

    // Synchronous set    
    // Next state logic
    always @(D, set_n)
    begin
        Q_next = Q_reg; // default value for safety
        if(!set_n)
            Q_next = 1'b1;
        else
            Q_next = D;
    end
    
    
    //-----------------------------------------------

    // Output logic
    assign Q = Q_reg;
endmodule
