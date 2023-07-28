#line 1 "C:/Users/DELL/Desktop/MCC/first.c"
void main()
{
TRISB=0x00;

while(1)
{
portb=0xff;
delay_ms(1000);
portb=0x00;
delay_ms(1000);
}


}
