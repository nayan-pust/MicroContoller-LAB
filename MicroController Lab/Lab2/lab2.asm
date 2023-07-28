
_main:

;lab2.c,2 :: 		void main()
;lab2.c,5 :: 		TRISC=0x00;
	CLRF       TRISC+0
;lab2.c,6 :: 		while(1)
L_main0:
;lab2.c,8 :: 		for(i=0;i<=9;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       main_i_L0+0, 0
	SUBLW      9
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;lab2.c,10 :: 		if(i%2!=0)
	MOVLW      2
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	XORWF      R0+0, 0
L__main10:
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;lab2.c,12 :: 		portc=array[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;lab2.c,13 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;lab2.c,14 :: 		}
L_main5:
;lab2.c,15 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;lab2.c,8 :: 		for(i=0;i<=9;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;lab2.c,17 :: 		}
	GOTO       L_main2
L_main3:
;lab2.c,18 :: 		}
	GOTO       L_main0
;lab2.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
