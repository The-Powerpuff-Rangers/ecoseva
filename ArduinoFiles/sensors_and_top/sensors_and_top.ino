#include <Servo.h>

const int trigger_pin = 5;
const int echo_pin = 6;
const int led_pin = 12;
const int ir_pin = 10;
const int pin = 8;
unsigned long last_time = 0;
const unsigned long interval = 1; // Interval between measurements (1 minute)
float current_distance = 0;
float previous_distance = 0;
const float bin_height = 16.5;

Servo myservo;

void setup() {
  pinMode(led_pin, OUTPUT);
  pinMode(ir_pin, INPUT);
  pinMode(trigger_pin, OUTPUT);
  pinMode(echo_pin, INPUT);  
  myservo.attach(pin);
  myservo.write(0);
  Serial.begin(9600);
}

void loop() {
  unsigned long current_time = millis();

  int ir_value = digitalRead(ir_pin);

  // If the IR sensor detects something, switch on the LED
  if (ir_value == LOW) {
    //Serial.println("OPEN BOX");
    myservo.write(100);
 
    
  } else {
    //Serial.println("CLOSE BOX");
    myservo.write(20);
    Serial.println("1");  
    delay(3000);
  
  }
  
  // Take a measurement every 5 minutes
  if (current_time - last_time >= interval && ir_value != HIGH) {
    last_time = current_time;

    digitalWrite(trigger_pin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigger_pin, LOW);

    
    float duration = pulseIn(echo_pin, HIGH);
    current_distance = duration * 0.034 / 2; // Measure distance and convert to cm
    current_distance = current_distance - 5;
    float filled_percentage = 100 * ((1 - current_distance / bin_height)); // Calculate filled percentage
    if (filled_percentage <= 0) {
      filled_percentage = 0;
    }
    //Serial.print("Filled percentage: ");
    
    Serial.print(filled_percentage);
    Serial.println(" %");    
    
    
    if (filled_percentage > 70) { // If bin is more than 80% full, turn on LED
      //Serial.println("LED ON");
      digitalWrite(led_pin, HIGH);
    } else { // Otherwise, turn off LED
      //Serial.println("LED OFF");
      digitalWrite(led_pin, LOW);
    }
    
    previous_distance = current_distance; // Store current distance as previous distance
  }

  delay(100); // Delay for 100ms before repeating loop
}

