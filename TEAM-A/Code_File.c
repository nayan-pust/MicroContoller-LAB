// 4 Digit 7 segment LED for COMMON CATHODE
char ArrayCC[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main()
{
    int button1=0,button2=0,button3=0,button4=0;
    TRISD=0xff;
    TRISB=0x00;
    TRISC=0x00;
    portb=0x00;
    portd=0x00;
    while(1)
    {

        if(portd.f0==0x00)
        {
            delay_ms(20);
            if (portd.f0==0x00)
             {
                button1++;
                if(button1>9)
                    button1=0;
            }
        }

        if (portd.f1==0x00)
        {
            delay_ms(20);
            if (portd.f1==0x00) {
                button2++;
                if(button2>9)
                    button2=0;
            }
        }

        if (portd.f2==0x00)
        {
            delay_ms(20);
            if(portd.f2==0x00)
            {
                button3++;
                if(button3>9)
                   button3=0;
            }
        }

        if (portd.f3==0x00)
        {
            delay_ms(20);
            if(portd.f3==0x00)
            {
                button4++;
                if(button4>9)
                    button4=0;
            }
        }

           if(button1==7 &&button2==9 &&button3==3 &&button4==8) // for master password use and engine full time supports
           {
               portc.f4=0xff;
               portc.f5=0xff;
               portc.f6=0xff;
               portc.f7=0xff;
           
           }

        else if(button1==7 &&button2==2 && button3==9 &&button4==5)  //set password  when match the password then led will blinking
        {

             portc.f4=0xff;
             portc.f5=0xff;
             portc.f6=0x00;
             portc.f7=0x00;


        }
        else if(button1==6 &&button2==5 &&button3==3 &&button4==8)   //set second password  when also match the password then led will blinking
        {

             portc.f4=0x00;
             portc.f5=0x00;
             portc.f6=0xff;
             portc.f7=0xff;

        }
        else    //password not maching when engine not work all led off
        {
             portc.f4=0x00;
             portc.f5=0x00;
             portc.f6=0x00;
             portc.f7=0x00;
        }
        
        portb=ArrayCC[button1];
        portc.f0=0x00;
        delay_ms(1);
        portc.f0=0xff;

        portb=ArrayCC[button2];
        portc.f1=0x00;
        delay_ms(1);
        portc.f1=0xff;

        portb=ArrayCC[button3];
        portc.f2=0x00;
        delay_ms(1);
        portc.f2=0xff;

        portb=ArrayCC[button4];
        portc.f3=0x00;
        delay_ms(1);
        portc.f3=0xff;
    }
}
