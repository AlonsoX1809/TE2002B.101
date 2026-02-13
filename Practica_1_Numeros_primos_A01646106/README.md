Miguel Alonso De La Rosa Zamora A01646106
# Decodificación de Número Primo con 4 Variables en FPGA 
## Objetivo: 
 - Implementar un sistema en Verilog que lea el valor de 4 switches de la FPGA , interprete su valor como un número binario y determine si es un número primo. El resultado se mostrará encendiendo un LED.

## Materiales Necesarios:
 - Tarjeta FPGA DE10-Lite
 - Cable USB Blaster para la programación
 - Software Intel Quartus Prime Lite
 - Código en Verilog
## Descripción del Funcionamiento:
 - Los 4 switches de la FPGA representan un número en binario.
 - El valor ingresado en los switches se verifica para determinar si es un número primo.
 - Se enciende el led cuando el numero es primo.
## Desarrollo de la Práctica:
 1. Definir las entradas y salidas:
   - Entradas: 4 switches (SW[3:0])
   - Salidas: LED
Subir el repositorio donde se encuentran los archivos .v de los módulos, su testbench, y las imágenes necesarias para comprobar el óptimo funcionamiento del sistema.

## Descripción del módulo
El módulo 'numPrim' recibe cuatro entradas (a, b, c, d) que representan un número binario y genera una salida 'out' que vale:
 - '1' -> el número es primo.
 - '0' -> el número no es primo. 
## Testbench
Se desarrolló un testbench para verificar el funcionamiento del módulo 'numPrim', aplicando cada uno de los casos posibles para las cuatro variables. 
## Cálculos 
Para obtener la ecuación booleana del módulo 'numPrim' se creo una tabla de verdad, y con ella se utilizó un mapa de Karnaugh para obtener la ecuacion con maxTérminos más simplificada. 
![Captura de la tabla de verdad y Mapa de Karnaugh](imagenes/mapa.png)
## Diagrama RTL
El siguiente diagrama muestra la implementación lógica generada por Quartus a partir del
código Verilog del módulo.
![Diagrama RTL](imagenes/rtl_viewer.png)
## Waveform
A continuación se observa la simulación temporal del circuito, donde se verifica el
comportamiento correcto de la salida para los distintos valores de entrada.
![Simulación](imagenes/sim.png)
![Simulación waveform](imagenes/waveform.png)
## Tarjeta DEL10-lite funcionando
![Caso 0](imagenes/caso_0.png)
![Caso 1](imagenes/caso_1.png)
![Caso 2](imagenes/caso_2.png)
![Caso 3](imagenes/caso_3.png)
![Caso 4](imagenes/caso_4.png)
![Caso 5](imagenes/caso_5.png)
![Caso 6](imagenes/caso_6.png)
![Caso 7](imagenes/caso_7.png)
![Caso 8](imagenes/caso_8.png)
![Caso 10](imagenes/caso_10.png)
![Caso 11](imagenes/caso_11.png)
![Caso 12](imagenes/caso_12.png)
![Caso 13](imagenes/caso_13.png)
![Caso 14](imagenes/caso_14.png)
![Caso 15](imagenes/caso_15.png)
