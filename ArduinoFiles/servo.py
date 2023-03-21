import serial
import time

ser = serial.Serial('COM8', 9600)  
time.sleep(2) 
angle = 160
while True:

        time.sleep(1.5)
        ser.write(str(angle).encode()) 
        print("Angle sent: " + str(angle))
        time.sleep(2)
        ser.write(str(90).encode()) 
