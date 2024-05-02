`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 17:34:26
// Design Name: 
// Module Name: SUMADOR_DE_64BITS
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


module SUMADOR_DE_64BITS(
    input logic [63:0] A,
    input logic [63:0] B,
    input logic Cin,
    output logic [63:0] S,
    output logic Cout
);

    logic [31:0] S0;
    logic Cout1;

    // Sumador de los bits menos significativos (0 al 31)
    SUMADOR_DE_32BITS sumador0(
        .A(A[31:0]), // Divide A en dos grupos de 32 bits
        .B(B[31:0]), // Divide B en dos grupos de 32 bits
        .Cin(Cin),
        .S(S[31:0]),
        .Cout(Cout1)
    );

    // Sumador de los bits más significativos (32 al 63)
    SUMADOR_DE_32BITS sumador1(
        .A(A[63:32]), // Divide A en dos grupos de 32 bits
        .B(B[63:32]), // Divide B en dos grupos de 32 bits
        .Cin(Cout1), // El acarreo de salida del sumador0 es el acarreo de entrada del sumador1
        .S(S[63:32]), // Conecta las salidas del sumador0 a las entradas del sumador1
        .Cout(Cout)
    );

    // Acarreo final
    assign Cout = Cout1;
endmodule
