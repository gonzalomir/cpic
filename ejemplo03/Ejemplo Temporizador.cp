#line 1 "G:/icei/cpic/ejemplo03/Ejemplo Temporizador.c"
sbit LEd at RA0_bit;
sbit btn0 at RB0_bit;
sbit btn1 at RB1_bit;
sbit btn2 at RB2_bit;

unsigned short num;
unsigned short aux;

void interrupt() {
 num++;
 if(num == aux) {
 LED = ~LED;
 num = 0;
 }
 TMR0 = 39;
 INTCON.T0IF = 0;
}

void main() {
 TRISA0_bit = 0;
 TRISB0_bit = 1;
 TRISB1_bit = 1;
 TRISB2_bit = 1;
 LED = 0;
 num = 0;
 aux=18;
 OPTION_REG = 0x07;
 TMR0 = 39;
 INTCON = 0xA0;
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
 }while(1);
}
