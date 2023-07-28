
_main:

;first.c,1 :: 		void main()
;first.c,3 :: 		TRISB=0x00;
	CLRF       TRISB+0
;first.c,5 :: 		while(1)
L_main0:
;first.c,7 :: 		portb=0xff;
	MOVLW      255
	MOVWF      PORTB+0
;first.c,8 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;first.c,9 :: 		portb=0x00;
	CLRF       PORTB+0
;first.c,10 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;first.c,11 :: 		}
	GOTO       L_main0
;first.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
