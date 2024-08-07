`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2021 02:14:59 PM
// Design Name: 
// Module Name: mux_generic_1bit
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


// In always statement variables retain their previous values if not assigned 
// any new value ; so a latch is inferred in the schematic even of combinational logics

// all branches of if and all cases of switch cases must be included (use default values)


module mux_generic_1bit
    #(parameter N = 4)(
        input [N - 1: 0] w,
        input [$clog2(N) - 1:0] s, // ceil log
        output reg f
    );
    
    integer k; // not genvar since not inside a generate block since this is behavioural

    always @(w, s)
    begin
        f = 'bx;
        for (k = 0; k < N ; k = k + 1)
        // due to if statements this is also bunch of 2*1
            if (k == s)
                f = w[k];
    end
    
endmodule
