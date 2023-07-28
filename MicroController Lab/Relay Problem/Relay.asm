
_main:

;Relay.c,1 :: 		void main()
;Relay.c,3 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Relay.c,4 :: 		portb=0x00;
	CLRF       PORTB+0
;Relay.c,6 :: 		while(1)
L_main0:
;Relay.c,8 :: 		portb.f0=0xff;
	BSF        PORTB+0, 0
;Relay.c,9 :: 		delay_ms(1000);
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
;Relay.c,10 :: 		portb.f0=0x00;
	BCF        PORTB+0, 0
;Relay.c,11 :: 		delay_ms(1000);
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
;Relay.c,12 :: 		}
	GOTO       L_main0
;Relay.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
