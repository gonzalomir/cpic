#line 1 "G:/icei/cpic/ejemplo02/Ejemplo 02.c"
const unsigned short digitos[10]={

 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01100111
};code;

unsigned short valorPORTA;

void main() {
 TRISA = 0b11111;
 TRISB = 0b00000000;
 do{
 valorPORTA=PORTA;
 if(valorPORTA>=0 && valorPORTA<10){
 PORTB=digitos[valorPORTA];
 Delay_ms(10);
 }
 }while(1);
}
