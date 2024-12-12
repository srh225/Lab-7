`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 06:09:02 AM
// Design Name: 
// Module Name: Mealy_machine_tb
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


module Mealy_machine_tb;
    reg P1;
    reg clk;
    reg reset;
    
    wire z;
    
    Mealy_machine uut (.P1(P1), .clk(clk), .reset(reset), .z(z));

initial begin
        clk = 0;
        forever #5 clk = ~ clk; 
    end 

initial begin
        reset = 1; P1 = 0;
        #10 reset = 0;
        #5 P1 = 1; #5 P1 = 1; #5 P1 = 0; #5 P1 = 1;
        #10 P1 = 1; #10 P1 = 1; #10 P1 = 0; #10 P1 = 1;
        #20 $stop; 
        
          
        #10 $finish;
    end
endmodule
