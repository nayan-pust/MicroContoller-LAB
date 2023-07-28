
char arrayCA[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
void main() 

{
int i=0;
TRISB=0x00;
TRISD=0xff;
TRISC=0x00;
portc=0x00;
portb=0x00;
portb.f1=0xff;
portb.f0=0x00;


while(1)

{
if(portd.f0==0x00)
{
 delay_ms(200);
   if(portd.f0==0x00)
   {
     if(i<9)
     i++;
     if(i>=5)
     {
      portb.f1=0x00;
     portb.f0=0xff;
      }
   }

}
if(portd.f1==0x00)
{
delay_ms(200);
if(portd.f1==0x00)
{
  if(i!=0)
  i--;
  if(i<5)
    {
  portb.f1=0xff;
  portb.f0=0x00;
  }
}

}
portc=arrayCA[i];


}

}