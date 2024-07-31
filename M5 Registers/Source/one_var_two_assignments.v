`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 12:31:17 PM
// Design Name: 
// Module Name: one_var_two_assignments
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

// assign a variable in only one always block since verilog is not line by line

module one_var_two_assignments(
    input a, b,
    output reg x
    );
    
    // Assigning a single variable in 2 different always statements
    // will create a race condition and it should be avoided

    always @(a, b)
    begin
        x = a & b;
    end
    
    always @(a, b)
    begin
        x = a | b;
    end
endmodule
