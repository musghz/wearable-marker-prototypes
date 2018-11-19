/// @brief Pretend to use a microcontroller to read a sensor value and control
/// a servo actuator
///
/// Check out the actual Arduino servo code here:
/// https://www.arduino.cc/en/Tutorial/Knob
///
/// Created 19 Nov 2018
///
/// @author Mustafa Ghazi

#include<stdio.h>

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin

/// @brief Attach servo (actuator) to a pin
void myServoAttach(int pin) {
    printf("servo attached at pin %d\nCommand values 0-180 degrees\n", pin);
}

/// @brief Read analog value from a sensor (range 0-1023)
int analogRead(int pin) {
    int val = 0;
    printf("Enter a sensor value 0-1023: ");
    scanf("%d", &val);
    return val;
}

/// @brief Map a value from range 1 to range 2
int map(double val, double range1, double range2){
    double answer;
    answer = val/range1*range2;
    return (int)answer;
}

/// @brief Set servo to angle position
void myServoWrite(int val) {
    printf("Setting servo at %d degrees\n", val);
}

int main() {
    myServoAttach(9);  // attaches the servo on pin 9 to the servo object
    while(1) {
        val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023)
        val = map(val, 1023, 180);     // scale it to use it with the servo (value between 0 and 180)
        myServoWrite(val);                  // sets the servo position according to the scaled value
    }


}

