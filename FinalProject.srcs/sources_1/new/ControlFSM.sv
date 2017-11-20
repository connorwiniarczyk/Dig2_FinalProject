`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2017 06:49:21 PM
// Design Name: 
// Module Name: ControlFSM
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


module ControlFSM(
        input logic clk, reset, // standard clock and reset inputs
        input logic enter, newPassword, // These should go HIGH for 1 clock cycle when the user presses the "E" or "A" buttons on the keypad, respectively
        input logic match, // this is a boolean value that represents whether the password the user is typing matches the stored one, it should go high as soon as they match
        output logic [1:0] buzzerMode,  // a 2-bit signal that tells the buzzer module what to do.  00 is off, 01 is wrong, 10 is right, 11 is unused
        output logic [1:0] displayMode,  // a 2-bit signal that tells the display controller what to do.
        output logic setPassword        // a pulse which controls when a new password is set. When this is high, the storePassword Module should set the current Password to whatever the user has typed
    );
    
    typedef enum logic [2:0] {BASE, ECUR, NPASS, CORRECT, WRONG} State;
    
    State currentState, nextState;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)   currentState = BASE;
        else        currentState = nextState;
    end
    
    always_comb begin
        case(currentState)
        
            BASE:   if(newPassword)         nextState = ECUR;
                    else if(enter & match)  nextState = CORRECT;
                    else if(enter & !match) nextState = WRONG;
                    else                    nextState = BASE;
            
            ECUR:   if(enter & match)       nextState = NPASS;
                    else                    nextState = ECUR;
            
            NPASS:  if(enter)               nextState = BASE;
                    else                    nextState = NPASS;
            
            CORRECT:                        nextState = BASE;
            
            WRONG:                          nextState = BASE;
        
        endcase
    end
    
endmodule
