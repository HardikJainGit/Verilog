`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2021 12:12:48 PM
// Design Name: 
// Module Name: pwm_improved
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


module pwm_improved
    #(parameter R = 8, TIMER_BITS = 15)(
    input clk,
    input reset_n,
    input [R:0] duty, // Control the Duty Cylce
    input [TIMER_BITS - 1:0] FINAL_VALUE, // Control the switching frequency
    output pwm_out
    );
    
    reg [R - 1:0] Q_reg, Q_next;
    reg d_reg, d_next;
    wire tick;
    
    // Up Counter
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
        begin
            Q_reg <= 'b0;
            d_reg <= 1'b0;
        end
        else if (tick)
        begin
            Q_reg <= Q_next;
            d_reg <= d_next;
        end
        else
        begin
            Q_reg <= Q_reg;
            d_reg <= d_reg;
        end                  
    end

    // Tick gives enable as 1 for a short time such that counter only increments by 1
    // Tick takes 195*T_clk time to tick for a short time and then counter increases by 1
    // For the counter to increase by 1 and reach 2^R - 1 ; it needs 2^R - 1 enables
    // For that the time needed is 2^R * T_tick = 2^R * T_clk * 195
    // It increases the width of each numbers' hold by the timer tick's time i.e T_clk * 195
    
    // Next state logic
    always @(Q_reg, duty)
    begin
        Q_next = Q_reg + 1;
        d_next = (Q_reg < duty);
    end
    
    assign pwm_out = d_reg;
    
    // Prescalar Timer

    timer_input #(.BITS(TIMER_BITS)) timer0 (
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .FINAL_VALUE(FINAL_VALUE),
        .done(tick)
    );
    
endmodule
