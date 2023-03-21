import serial

ser = serial.Serial('COM7', 9600) 

while (True):
        if ser.in_waiting > 0:
            distance = ser.readline().decode('utf-8').rstrip()
            print(distance)
        
