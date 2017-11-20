`timescale 1ns / 1ps

module TopLevel(
        input clk, reset,
        input [3:0] keyPad,
        
        output buzzer,
        output [7:0] digits,
        output [6:0] segments
    );
    
    
    
endmodule

module KeyPadController(
        input [3:0] keyPad,
        
        output [4:0] digits [3:0],
        output enter,
        output newPassword
    );
endmodule

module PasswordStore(
        input [3:0] newPassword [3:0],
        input set,
        output password
    );
endmodule