`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 16:09:39
// Design Name: 
// Module Name: SUMADOR_DE_2BITS
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


module SUMADOR_DE_2BITS(
    input logic A0, 
    input logic A1,
    input logic B0, 
    input logic B1,
    input logic Cin,
    output logic S0, 
    output logic S1,
    output logic Cout
);

    logic Cout1;

    // Sumador de bit 0
    SUMADOR_DE_1BIT sumador0(
        .A(A0), 
        .B(B0), 
        .Cin(Cin), 
        .S(S0), 
        .Cout(Cout1)
    );
    
    // Sumador de bit 1
    SUMADOR_DE_1BIT sumador1(
        .A(A1), 
        .B(B1), 
        .Cin(Cout1), 
        .S(S1), 
        .Cout(Cout)
    );
endmodule