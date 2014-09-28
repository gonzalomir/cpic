
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Ejemplo Temporizador.c,9 :: 		void interrupt() {
;Ejemplo Temporizador.c,10 :: 		num++;
	INCF       _num+0, 1
;Ejemplo Temporizador.c,11 :: 		if(num == aux) {
	MOVF       _num+0, 0
	XORWF      _aux+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
;Ejemplo Temporizador.c,12 :: 		LED = ~LED;       // Cambia el estado del led
	MOVLW
	XORWF      RA0_bit+0, 1
;Ejemplo Temporizador.c,13 :: 		num = 0;
	CLRF       _num+0
;Ejemplo Temporizador.c,14 :: 		}
L_interrupt0:
;Ejemplo Temporizador.c,15 :: 		TMR0 = 39;        // TMR0 returns to its initial value
	MOVLW      39
	MOVWF      TMR0+0
;Ejemplo Temporizador.c,16 :: 		INTCON.T0IF = 0;  // Limpiar el Bit T0IF cada vez que suceda la interrupcion
	BCF        INTCON+0, 2
;Ejemplo Temporizador.c,17 :: 		}
L_end_interrupt:
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Ejemplo Temporizador.c,19 :: 		void main() {
;Ejemplo Temporizador.c,20 :: 		TRISA0_bit = 0;    //Configurar como salida
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;Ejemplo Temporizador.c,21 :: 		TRISB0_bit = 1;
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Ejemplo Temporizador.c,22 :: 		TRISB1_bit = 1;
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;Ejemplo Temporizador.c,23 :: 		TRISB2_bit = 1;
	BSF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;Ejemplo Temporizador.c,24 :: 		LED = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;Ejemplo Temporizador.c,25 :: 		num = 0;
	CLRF       _num+0
;Ejemplo Temporizador.c,26 :: 		aux=18;
	MOVLW      18
	MOVWF      _aux+0
;Ejemplo Temporizador.c,27 :: 		OPTION_REG = 0x07; // Preescalar 1:256
	MOVLW      7
	MOVWF      OPTION_REG+0
;Ejemplo Temporizador.c,28 :: 		TMR0 = 39;         // Timer 0 cuenta de 39 a 255
	MOVLW      39
	MOVWF      TMR0+0
;Ejemplo Temporizador.c,29 :: 		INTCON = 0xA0;     // Habilita el Timer 0 y las interrupciones globales
	MOVLW      160
	MOVWF      INTCON+0
;Ejemplo Temporizador.c,30 :: 		do{
L_main1:
;Ejemplo Temporizador.c,31 :: 		if(btn0){
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main4
;Ejemplo Temporizador.c,32 :: 		if(aux>1)
	MOVF       _aux+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Ejemplo Temporizador.c,33 :: 		aux--;
	DECF       _aux+0, 1
L_main5:
;Ejemplo Temporizador.c,34 :: 		while(btn0);
L_main6:
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;Ejemplo Temporizador.c,35 :: 		}
L_main4:
;Ejemplo Temporizador.c,36 :: 		if(btn1){
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main8
;Ejemplo Temporizador.c,37 :: 		aux=18;
	MOVLW      18
	MOVWF      _aux+0
;Ejemplo Temporizador.c,38 :: 		while(btn1);
L_main9:
	BTFSS      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;Ejemplo Temporizador.c,39 :: 		}
L_main8:
;Ejemplo Temporizador.c,40 :: 		if(btn2){
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main11
;Ejemplo Temporizador.c,41 :: 		aux++;
	INCF       _aux+0, 1
;Ejemplo Temporizador.c,42 :: 		while(btn2);
L_main12:
	BTFSS      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;Ejemplo Temporizador.c,43 :: 		}
L_main11:
;Ejemplo Temporizador.c,44 :: 		}while(1);  // Bucle Infinito
	GOTO       L_main1
;Ejemplo Temporizador.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
