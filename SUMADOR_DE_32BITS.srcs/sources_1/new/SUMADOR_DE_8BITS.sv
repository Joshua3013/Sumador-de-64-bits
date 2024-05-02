`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 17:04:59
// Design Name: 
// Module Name: SUMADOR_DE_8BITS
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


module SUMADOR_DE_8BITS(
    input logic [7:0] A,
    input logic [7:0] B,
    input logic Cin,
    output logic [7:0] S,
    output logic Cout
);

    logic [3:0] S0;
    logic Cout1;

    // Sumador de los bits menos significativos (0 al 3)
    SUMADOR_DE_4BITS sumador0(
        .A(A[3:0]), // Divide A en dos grupos de 4 bits
        .B(B[3:0]), // Divide B en dos grupos de 4 bits
        .Cin(Cin),
        .S(S[3:0]),
        .Cout(Cout1)
    );

    // Sumador de los bits más significativos (4 al 7)
    SUMADOR_DE_4BITS sumador1(
        .A(A[7:4]), // Divide A en dos grupos de 4 bits
        .B(B[7:4]), // Divide B en dos grupos de 4 bits
        .Cin(Cout1), // El acarreo de salida del sumador0 es el acarreo de entrada del sumador1
        .S(S[7:4]), // Conecta las salidas del sumador0 a las entradas del sumador1
        .Cout(Cout)
    );

    // Acarreo final
    assign Cout = Cout1;
endmodule

