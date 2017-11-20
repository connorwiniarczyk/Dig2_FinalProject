`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2017 09:44:05 PM
// Design Name: 
// Module Name: ControlFSM_TB
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


module ControlFSM_TB();

    logic clk, reset, enter, newPassword, match, valid;
    logic [1:0] displayMode, buzzerMode;
    logic setPassword;
    
    logic [31:0] i;
    logic [9:0] testvector [1000:0];
    
    ControlFSM dut(
        .clk(clk),
        .reset(reset),
        .enter(enter),
        .newPassword(newPassword),
        .match(match),
        .valid(valid),
        .displayMode(displayMode),
        .buzzerMode(buzzerMode),
        .setPassword(setPassword)
    );
    
    initial begin
        $readmemb("testvector.tv", testvector);
        
        i=0;
        reset = 1; #1;
        reset = 0;
    end
    
    always @(posedge clk) begin
        {enter, reset, newPassword, match, valid} = testvector[i][9:5];
        $display("%b", testvector[i][9:5]);
    end
    
    always @(negedge clk) begin
        i = i+1;
    end
    
    always begin
        clk = 0; #1;
        clk = 1; #1;
    end
    

endmodule
