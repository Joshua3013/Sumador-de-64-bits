`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2024 17:40:37
// Design Name: 
// Module Name: SUMADOR_TB
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


module SUMADOR_TB;
    // Define señales de entrada y salida
    logic [63:0] A, B;
    logic Cin;
    logic [63:0] S;
    logic Cout;

    // Instancia del módulo SUMADOR_DE_64BITS
    SUMADOR_DE_64BITS dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Perfil de simulación
    initial begin
        // Vectores de prueba
        A = 64'b1010101010101010101010101010101010101010101010101010101010101010;   
        B = 64'b1111111111111111111111111111111111111111111111111111111111111111;   //888300
        Cin = 1'b0;
        
        // Inicia la simulación
        #1; // Espera un ciclo para estabilizar las señales
        
        // Realiza la suma
        #1;
        // Verifica los resultados
        if (S !== 64'b11010101010101010101010101010101010101010101010101010101010101001  || Cout !== 1'b1) begin //1746456    1AA618
            $display("Error: Prueba fallida - suma incorrecta");
            $finish;
        end else begin
            $display("Prueba exitosa: suma correcta");
        end
        
        // Finaliza la simulación
        $finish;
        
    end
endmodule


