sbit led at RB0_bit;            // Declaramos alias led
sbit trisLed at TRISB0_bit;     // Declaramos alias trisLed

bit estado;                     // Variable que define el estado del led

// Funcion principal
void main() {
     // Zona del codigo de configuracion y inicializacion de variables
     estado=1;   // Inicializamos la variable estado
     trisLed=0;  // trisLed configura  el pin del como salida
     
     // Zona del codigo del programa principal
     do{
        led=estado;     // Carga el estado en el led
        estado=1-estado;// Cambia el valor del estado
        Delay_ms(1000); // Retardo de un segundo
     }while(1);
}