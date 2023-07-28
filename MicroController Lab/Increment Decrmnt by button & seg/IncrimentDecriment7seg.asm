
_main:

;IncrimentDecriment7seg.c,3 :: 		void main()
;IncrimentDecriment7seg.c,6 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;IncrimentDecriment7seg.c,7 :: 		TRISB=0x00;
	CLRF       TRISB+0
;IncrimentDecriment7seg.c,8 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;IncrimentDecriment7seg.c,9 :: 		TRISC=0x00;
	CLRF       TRISC+0
;IncrimentDecriment7seg.c,10 :: 		portc=0x00;
	CLRF       PORTC+0
;IncrimentDecriment7seg.c,11 :: 		portb=0x00;
	CLRF       PORTB+0
;IncrimentDecriment7seg.c,12 :: 		portb.f1=0xff;
	BSF        PORTB+0, 1
;IncrimentDecriment7seg.c,13 :: 		portb.f0=0x00;
	BCF        PORTB+0, 0
;IncrimentDecriment7seg.c,16 :: 		while(1)
L_main0:
;IncrimentDecriment7seg.c,19 :: 		if(portd.f0==0x00)
	BTFSC      PORTD+0, 0
	GOTO       L_main2
;IncrimentDecriment7seg.c,21 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;IncrimentDecriment7seg.c,22 :: 		if(portd.f0==0x00)
	BTFSC      PORTD+0, 0
	GOTO       L_main4
;IncrimentDecriment7seg.c,24 :: 		if(i<9)
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      9
	SUBWF      main_i_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;IncrimentDecriment7seg.c,25 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
L_main5:
;IncrimentDecriment7seg.c,26 :: 		if(i>=5)
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      5
	SUBWF      main_i_L0+0, 0
L__main14:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;IncrimentDecriment7seg.c,28 :: 		portb.f1=0x00;
	BCF        PORTB+0, 1
;IncrimentDecriment7seg.c,29 :: 		portb.f0=0xff;
	BSF        PORTB+0, 0
;IncrimentDecriment7seg.c,30 :: 		}
L_main6:
;IncrimentDecriment7seg.c,31 :: 		}
L_main4:
;IncrimentDecriment7seg.c,33 :: 		}
L_main2:
;IncrimentDecriment7seg.c,34 :: 		if(portd.f1==0x00)
	BTFSC      PORTD+0, 1
	GOTO       L_main7
;IncrimentDecriment7seg.c,36 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
;IncrimentDecriment7seg.c,37 :: 		if(portd.f1==0x00)
	BTFSC      PORTD+0, 1
	GOTO       L_main9
;IncrimentDecriment7seg.c,39 :: 		if(i!=0)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main15:
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;IncrimentDecriment7seg.c,40 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
L_main10:
;IncrimentDecriment7seg.c,41 :: 		if(i<5)
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      5
	SUBWF      main_i_L0+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;IncrimentDecriment7seg.c,43 :: 		portb.f1=0xff;
	BSF        PORTB+0, 1
;IncrimentDecriment7seg.c,44 :: 		portb.f0=0x00;
	BCF        PORTB+0, 0
;IncrimentDecriment7seg.c,45 :: 		}
L_main11:
;IncrimentDecriment7seg.c,46 :: 		}
L_main9:
;IncrimentDecriment7seg.c,48 :: 		}
L_main7:
;IncrimentDecriment7seg.c,49 :: 		portc=arrayCA[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _arrayCA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;IncrimentDecriment7seg.c,52 :: 		}
	GOTO       L_main0
;IncrimentDecriment7seg.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
