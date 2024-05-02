`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 16:48:53
// Design Name: 
// Module Name: SUMADOR_DE_4BITS
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


module SUMADOR_DE_4BITS(
    input logic [3:0] A,
    input logic [3:0] B,
    input logic Cin,
    output logic [3:0] S,
    output logic Cout
);

    logic [1:0] Cout1;
    logic [1:0] S1;

    // Sumador de los bits menos significativos (0 y 1)
    SUMADOR_DE_2BITS sumador0(
        .A0(A[0]), 
        .A1(A[1]), 
        .B0(B[0]), 
        .B1(B[1]), 
        .Cin(Cin), 
        .S0(S[0]), 
        .S1(S[1]), 
        .Cout(Cout1[0])
    );

    // Sumador de los bits más significativos (2 y 3)
    SUMADOR_DE_2BITS sumador1(
        .A0(A[2]), 
        .A1(A[3]), 
        .B0(B[2]), 
        .B1(B[3]), 
        .Cin(Cout1[0]), 
        .S0(S[2]), 
        .S1(S[3]), 
        .Cout(Cout)
    );

    // Acarreo final
    assign Cout = Cout1[1];
endmodule
