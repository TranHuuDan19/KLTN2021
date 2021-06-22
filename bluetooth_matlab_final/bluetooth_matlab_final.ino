#include <SoftwareSerial.h>
//khai bao chan bluetooth
int TxD;
int RxD;
SoftwareSerial bluetooth(TxD, RxD);
//khai bao chan xuat tinh hieu ra module L298
int in1= 4;
int in2= 5;
int in3= 6;
int in4= 7;
char val;

void setup(){
  //khai bao chan output
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);
  // toc do baurd de giao tiep giua cac thiet bi la 9600
  Serial.begin(9600);
  bluetooth.begin(9600);
}

void loop(){
  while(bluetooth.available()>0)
  {
    val= bluetooth.read();
    Serial.print(val);
    Serial.print("\n");
  }
   if(val =='0') // vui- xe re trai
  {
    digitalWrite(in1 , LOW);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , HIGH);
    digitalWrite(in4 , LOW);
    delay(2000);
    digitalWrite(in3 , LOW);
  }
  else if(val =='1') //binh thuong - xe chay toi
  {
    
    digitalWrite(in1 , HIGH);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , HIGH);
    digitalWrite(in4 , LOW);                                                                                                                                                                                                                                                                                            
    delay(2000);
    digitalWrite(in1 , LOW);
    digitalWrite(in3 , LOW);
  }
  
  else if(val =='2') // ngac nhien - xe re phai
  {
    digitalWrite(in1 , HIGH);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , LOW);
    digitalWrite(in4 , LOW);
    delay(2000);
    digitalWrite(in1 , LOW);
    
  }

  if(val =='3') //gian du - xe chay lui
  {
    
    digitalWrite(in1 , LOW);
    digitalWrite(in2 , HIGH);
    digitalWrite(in3 , LOW);
    digitalWrite(in4 , HIGH);                                                                                                                                                                                                                                                                                            
    delay(2000);
    digitalWrite(in2 , LOW);
    digitalWrite(in4 , LOW);
  }
}
