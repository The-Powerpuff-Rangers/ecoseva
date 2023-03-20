#include <Servo.h>

Servo myservo;    
int pin = 9;

void setup() {
  myservo.attach(pin);  
  Serial.begin(9600);
  myservo.write(90);
}

void loop() {
  if (Serial.available() > 0) { 
    int angle = Serial.parseInt(); 
    myservo.write(angle); 
  }

   
}
