void main() 
{
TRISB=0x00;
//TRISB=0xff;
while(1)
{
portb=0xff;
delay_ms(1000);
portb=0x00;
delay_ms(1000);
}


}