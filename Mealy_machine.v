`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 06:08:26 AM
// Design Name: 
// Module Name: Mealy_machine
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


module Mealy_machine(
input P1,clk,reset,
    output reg z
);

parameter S0=0, S1=1, S2=2, S3=3;
reg [1:0] PS, NS;

always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0;   
            else    
                PS <= NS ;
        end             

    always@(PS or P1)
        begin 
            case(PS)
                S0: begin
                    z = 0;
                    if(P1)
                    begin
                        NS = S1;
                    end
                    else
                    begin
                        NS = S0;
                    end
                    end
                S1: begin
                    if(P1)
                    begin
                        NS = S2;
                    end
                    else
                    begin
                        NS = S1;
                    end
                    end
                S2: begin
                    if(!P1)
                    begin
                        NS = S3;
                    end
                    else if(P1)
                    begin
                        NS = S2;
                    end
                    end
                S3: begin
                    if(P1)
                    begin
                        NS = S1;
                        z = 1;
                    end
                    else if(!P1)
                    begin
                        NS = S0;
                    end
                    end
                endcase
            end
    always @ (PS)
    begin
        case (PS)
            S0 : z = 0;
            S1 : z = 0;
            S2 : z = 0;
            S3: begin
            if(P1)
                begin
                    z = 1;
                end
            end
        endcase
    end
endmodule
