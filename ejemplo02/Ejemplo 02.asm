
_main:

;Ejemplo 02.c,17 :: 		void main() {
;Ejemplo 02.c,18 :: 		TRISA = 0b11111;
	MOVLW      31
	MOVWF      TRISA+0
;Ejemplo 02.c,19 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;Ejemplo 02.c,20 :: 		do{
L_main0:
;Ejemplo 02.c,21 :: 		valorPORTA=PORTA;
	MOVF       PORTA+0, 0
	MOVWF      _valorPORTA+0
;Ejemplo 02.c,22 :: 		if(valorPORTA>=0 && valorPORTA<10){
	MOVLW      0
	SUBWF      _valorPORTA+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	MOVLW      10
	SUBWF      _valorPORTA+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
L__main7:
;Ejemplo 02.c,23 :: 		PORTB=digitos[valorPORTA];
	MOVF       _valorPORTA+0, 0
	ADDLW      _digitos+0
	MOVWF      R0+0
	MOVLW      hi_addr(_digitos+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;Ejemplo 02.c,24 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;Ejemplo 02.c,25 :: 		}
L_main5:
;Ejemplo 02.c,26 :: 		}while(1);
	GOTO       L_main0
;Ejemplo 02.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
