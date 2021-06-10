#include <SoftwareSerial.h>
int TxD;
int RxD;
SoftwareSerial bluetooth(TxD, RxD);
int in1= 4;
int in2= 5;
int in3= 6;
int in4= 7;
char val;

void setup(){
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  pinMode(in3, OUTPUT);
  pinMode(in4, OUTPUT);
  
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
  if(val =='1') //tien
  {
    
    digitalWrite(in1 , HIGH);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , HIGH);
    digitalWrite(in4 , LOW);                                                                                                                                                                                                                                                                                            
    delay(2000);
  }

  else if(val =='2') //lui
  {
    Serial.println("Backward");
    digitalWrite(in1 , LOW);
    digitalWrite(in2 , HIGH);
    digitalWrite(in3 , LOW);
    digitalWrite(in4 , HIGH);
    delay(2000);
  }



  else if(val =='3') // re phai
  {
    digitalWrite(in1 , HIGH);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , LOW);
    digitalWrite(in4 , LOW);
    delay(2000);
  }

   
  else if(val =='0') // stop dung lai
  {
    digitalWrite(in1 , LOW);
    digitalWrite(in2 , LOW);
    digitalWrite(in3 , LOW);
    digitalWrite(in4 , LOW);
    delay(2000);
  }
  
}
