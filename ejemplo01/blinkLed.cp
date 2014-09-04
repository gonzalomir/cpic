#line 1 "G:/icei/cpic/ejemplo01/blinkLed.c"
sbit led at RB0_bit;
sbit trisLed at TRISB0_bit;

bit estado;


void main() {

 estado=1;
 trisLed=0;


 do{
 led=estado;
 estado=1-estado;
 Delay_ms(1000);
 }while(1);
}
