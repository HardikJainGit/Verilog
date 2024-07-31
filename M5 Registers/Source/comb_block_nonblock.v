`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 10:23:55 AM
// Design Name: 
// Module Name: comb_block_nonblock
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


module comb_block_nonblock(
    input a, b, c,
    output reg x
    );
    vvddee
    // Blocking assignments
//    always @(a, b, c)
//    begin
          // one after another
//        x = a;
//        x = x ^ b;
//        x = x | c;
//    end

    // Nonblocking assignments (not in combinational)
//    always @(a, b, c)
//    begin
          // deferred and then overwritten
//        x <= a;
//        x <= x ^ b;
//        x <= x | c;
//    end    


    // Changing the order of blocking assignments
//    always @(a, b, c)
//    begin
//        x = a;
//        x = x | c;
//        x = x ^ b;
//    end

    // Changing the order of nonblocking assignments
    always @(a, b, c)
    begin
        x <= a;
        x <= x | c;
        x <= x ^ b;
    end  
endmodule
