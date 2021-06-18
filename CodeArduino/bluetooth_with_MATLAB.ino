#include <SoftwareSerial.h>
int TxD;
int RxD;
int data;
SoftwareSerial bluetooth(TxD, RxD);

void setup() {
  Serial.begin(9600);  
  bluetooth.begin(9600);
}

void loop() 
{
if(bluetooth.available() > 0)  // Send data only when you receive data:
{
data = bluetooth.read();      //Read the incoming data and store it into variable data
Serial.print(data);        //Print Value inside data in Serial monitor
Serial.print("\n");        //New line 
if(data == '1')            //Checks whether value of data is equal to 1 
digitalWrite(11, HIGH);  //If value is 1 then LED turns ON
else if(data == '0')       //Checks whether value of data is equal to 0
digitalWrite(11, LOW);   //If value is 0 then LED turns OFF
}                
  }


