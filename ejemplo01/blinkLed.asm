
_main:

;blinkLed.c,7 :: 		void main() {
;blinkLed.c,9 :: 		estado=1;   // Inicializamos la variable estado
	BSF        _estado+0, BitPos(_estado+0)
;blinkLed.c,10 :: 		trisLed=0;  // trisLed configura  el pin del como salida
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;blinkLed.c,13 :: 		do{
L_main0:
;blinkLed.c,14 :: 		led=estado;     // Carga el estado en el led
	BTFSC      _estado+0, BitPos(_estado+0)
	GOTO       L__main5
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__main6
L__main5:
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
L__main6:
;blinkLed.c,15 :: 		estado=1-estado;// Cambia el valor del estado
	CLRF       R0+0
	BTFSC      _estado+0, BitPos(_estado+0)
	INCF       R0+0, 1
	MOVF       R0+0, 0
	SUBLW      1
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__main7
	BCF        _estado+0, BitPos(_estado+0)
	GOTO       L__main8
L__main7:
	BSF        _estado+0, BitPos(_estado+0)
L__main8:
;blinkLed.c,16 :: 		Delay_ms(1000); // Retardo de un segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;blinkLed.c,17 :: 		}while(1);
	GOTO       L_main0
;blinkLed.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
