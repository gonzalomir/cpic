const unsigned short digitos[10]={
 //.gfedcba
 0b00111111, //0
 0b00000110, //1
 0b01011011, //2
 0b01001111, //3
 0b01100110, //4
 0b01101101, //5
 0b01111101, //6
 0b00000111, //7
 0b01111111, //8
 0b01100111  //9
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