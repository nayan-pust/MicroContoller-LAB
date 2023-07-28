#line 1 "C:/Users/DELL/Desktop/MicroController Lab/7segment 2 Digit/twodigtseg.c"
 char Array_CA[]={0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};

void main()

{
 int i,k,mod=0,res=0;
 TRISD=0x00;
 TRISC=0x00;
 TRISB=0x00;
 portb=0x00;
 portd=0x00;

 portd.f1=0x00;

 while(1)
 {
 for(i=0;i<=99;i++)
 {
 if(i==15)
 {
 portd.f1=0xff;

 }
 portd.f1=0xff;
 delay_ms(300);
 portd.f1=0x00;


 res=i/10;
 mod=i%10;
 for(k=0;k<50;k++)
 {
 portc.f0=1;
 portb=Array_CA[res];
 delay_ms(10);
 portc.f0=0;
 portc.f1=1;
 portb=Array_CA[mod];
 delay_ms(10);
 portc.f1=0;
 }

 }

 }
}
