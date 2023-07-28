
_main:

;twodigtseg.c,3 :: 		void main()
;twodigtseg.c,6 :: 		int i,k,mod=0,res=0;
	CLRF       main_mod_L0+0
	CLRF       main_mod_L0+1
	CLRF       main_res_L0+0
	CLRF       main_res_L0+1
;twodigtseg.c,7 :: 		TRISD=0x00;
	CLRF       TRISD+0
;twodigtseg.c,8 :: 		TRISC=0x00;
	CLRF       TRISC+0
;twodigtseg.c,9 :: 		TRISB=0x00;
	CLRF       TRISB+0
;twodigtseg.c,10 :: 		portb=0x00;
	CLRF       PORTB+0
;twodigtseg.c,11 :: 		portd=0x00;
	CLRF       PORTD+0
;twodigtseg.c,13 :: 		portd.f1=0x00;
	BCF        PORTD+0, 1
;twodigtseg.c,15 :: 		while(1)
L_main0:
;twodigtseg.c,17 :: 		for(i=0;i<=99;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       main_i_L0+0, 0
	SUBLW      99
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;twodigtseg.c,19 :: 		if(i==15)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      15
	XORWF      main_i_L0+0, 0
L__main14:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;twodigtseg.c,21 :: 		portd.f1=0xff;
	BSF        PORTD+0, 1
;twodigtseg.c,23 :: 		}
L_main5:
;twodigtseg.c,24 :: 		portd.f1=0xff;
	BSF        PORTD+0, 1
;twodigtseg.c,25 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;twodigtseg.c,26 :: 		portd.f1=0x00;
	BCF        PORTD+0, 1
;twodigtseg.c,29 :: 		res=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_res_L0+0
	MOVF       R0+1, 0
	MOVWF      main_res_L0+1
;twodigtseg.c,30 :: 		mod=i%10;
	MOVLW      10
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
	MOVF       R0+0, 0
	MOVWF      main_mod_L0+0
	MOVF       R0+1, 0
	MOVWF      main_mod_L0+1
;twodigtseg.c,31 :: 		for(k=0;k<50;k++)
	CLRF       main_k_L0+0
	CLRF       main_k_L0+1
L_main7:
	MOVLW      128
	XORWF      main_k_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      50
	SUBWF      main_k_L0+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;twodigtseg.c,33 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;twodigtseg.c,34 :: 		portb=Array_CA[res];
	MOVF       main_res_L0+0, 0
	ADDLW      _Array_CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;twodigtseg.c,35 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;twodigtseg.c,36 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;twodigtseg.c,37 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;twodigtseg.c,38 :: 		portb=Array_CA[mod];
	MOVF       main_mod_L0+0, 0
	ADDLW      _Array_CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;twodigtseg.c,39 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
;twodigtseg.c,40 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;twodigtseg.c,31 :: 		for(k=0;k<50;k++)
	INCF       main_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_k_L0+1, 1
;twodigtseg.c,41 :: 		}
	GOTO       L_main7
L_main8:
;twodigtseg.c,17 :: 		for(i=0;i<=99;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;twodigtseg.c,43 :: 		}
	GOTO       L_main2
L_main3:
;twodigtseg.c,45 :: 		}
	GOTO       L_main0
;twodigtseg.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
