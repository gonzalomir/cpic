sbit LED at RA0_bit;
sbit btn0 at RB0_bit;
sbit btn1 at RB1_bit;
sbit btn2 at RB2_bit;

unsigned short num;
unsigned short aux;

void interrupt() {
    num++;
    if(num == aux) {
       LED = ~LED;       // Cambia el estado del led
       num = 0;
    }
    TMR0 = 39;        // TMR0 returns to its initial value
    INTCON.T0IF = 0;  // Limpiar el Bit T0IF cada vez que suceda la interrupcion
}

void main() {
   a
   TRISA0_bit = 0;    //Configurar como salida
   TRISB0_bit = 1;
   TRISB1_bit = 1;
   TRISB2_bit = 1;
   LED = 0;
   num = 0;
   aux=18;
   OPTION_REG = 0x07; // Preescalar 1:256
   TMR0 = 39;         // Timer 0 cuenta de 39 a 255
   INTCON = 0xA0;     // Habilita el Timer 0 y las interrupciones globales
   do{
      if(btn0){
          if(aux>1)
             aux--;
          while(btn0);
      }
      if(btn1){
          aux=18;
          while(btn1);
      }
      if(btn2){
          aux++;
          while(btn2);
      }
   }while(1);  // Bucle Infinito
}