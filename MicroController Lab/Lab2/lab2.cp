#line 1 "C:/Users/DELL/Desktop/MicroController Lab/Lab2/lab2.c"
 char array[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
void main()
{
int i;
 TRISC=0x00;
 while(1)
 {
 for(i=0;i<=9;i++)
 {
 if(i%2!=0)
 {
 portc=array[i];
 delay_ms(1000);
 }
 delay_ms(1);

 }
 }

}
