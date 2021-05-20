
#include "EEPROM.h"

int led1 =2;
int led2 =3;
int led3 =4;

int data=0;
int tam=0;

void setup()
{
   Serial.begin (9600);
    pinMode(led1 , OUTPUT);
    pinMode(led2 , OUTPUT);
    pinMode(led3 , OUTPUT);
    
    if(EEPROM.read(1)==2)
    {
      digitalWrite(led1, LOW); 
      digitalWrite(led2, HIGH);
      digitalWrite(led3, LOW);
    }  
   else if(EEPROM.read(1)==3)
    {
      digitalWrite(led1, LOW);
      digitalWrite(led2, LOW);
      digitalWrite(led3, HIGH); 
    }  

    else if(EEPROM.read(1)==0)
    {
      digitalWrite(led1, LOW);
      digitalWrite(led2, LOW);
      digitalWrite(led3, LOW); 
      
    }  
   else if(EEPROM.read(1)==1)
    {
      digitalWrite(led1, HIGH); 
      digitalWrite(led2, LOW);  
      digitalWrite(led3, LOW); 
      delay(100); 
    }    
}

void loop()
{
  if(Serial.available()>0)
  {
      data = Serial.read();
  } 
    if(data==0) //khong co cam xuc nao
  {
        digitalWrite(led1,LOW);
        digitalWrite(led2,LOW); 
        digitalWrite(led3,LOW); 
        tam=0;
        EEPROM.write(1,tam);
        delay(100); 
  }
  
 else if(data==2) //vui -sang led thu 3 va tat led thu 2 & 4
  {
        digitalWrite(led1,LOW); 
        digitalWrite(led2,HIGH); 
        digitalWrite(led3,LOW); 
        tam=2;
        EEPROM.write(1,tam);
        delay(100); 
  }

  else if(data==1) //buon - sang led thu 2 va tat led thu 3 4 
  {
        digitalWrite(led1,HIGH);   
        digitalWrite(led2,LOW); 
        digitalWrite(led3,LOW);
        tam=1;
        EEPROM.write(1,tam);
        delay(100); 
  }

   else 
   if(data==3) //ngac nhien - sang led 4 va tat led 2 3
  {
        digitalWrite(led1,LOW); 
        digitalWrite(led2,LOW);
        digitalWrite(led3,HIGH);
        tam=3;
        EEPROM.write(1,tam);
        delay(100);        
  }
  Serial.print(EEPROM.read(1));
}
