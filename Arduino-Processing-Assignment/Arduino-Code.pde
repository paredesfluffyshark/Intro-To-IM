int redButton = 11;             // assigns a pin number to the first digital sensor
int blueButton = 10;            // assigns a pin number to the second digital sensor
int yellowButton = 9;           // assigns a pin number to the third digital sensor
int redButtonMODE = 0;          // senses the mode of the redButton (HIGH or LOW)
int blueButtonMODE = 0;         // senses the mode of the blueButton (HIGH or LOW)
int yellowButtonMODE = 0;       // senses the mode of the yellowButton (HIGH or LOW)       
const int LEDRED = 8;           // assigns a pin number to the red LED
const int LEDBLUE = 7;          // assigns a pin number to the blue LED
const int LEDYELLOW = 6;        // assigns a pin number to the yellow LED
char State = 'N';               // initializes the variable that is sent to the Arduino in order to communicate to 
                                // Processing what is going on on the bread board

//copied from the example sketch in Arduino: SerialCallResponse by Tom Igoe
void setup() {
  // start serial port at 9600 bps and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  pinMode(redButton, INPUT);      // assigns the red button on digital pin 11
  pinMode(blueButton, INPUT);     // assigns the blue button on digital pin 10
  pinMode(yellowButton, INPUT);   // assigns the yellow button on digital pin 9
  pinMode(LEDRED, OUTPUT);        // assigns the red light to digital pin 8
  pinMode(LEDBLUE, OUTPUT);       // assigns the blue light to digital pin 7
  pinMode(LEDYELLOW, OUTPUT);     // assigns the yellow light to digital pin 6
}

void loop() {


  redButtonMODE = digitalRead(redButton);         // reads the state of pin 11 (can be HIGH or LOW) which is connected to the red button
  blueButtonMODE = digitalRead(blueButton);       // reads the state of pin 10 (can be HIGH or LOW) which is connected to the red button
  yellowButtonMODE = digitalRead(yellowButton);   // reads the state of pin 9 (can be HIGH or LOW) which is connected to the red button
  State = 'N';                                    // sets the default state as the character 'N'
  
  // if red button is clicked (HIGH), red light will turn on (HIGH) and character 'r' will continually be sent to arduino
  if (redButtonMODE == HIGH) {
    digitalWrite(LEDRED, HIGH);
    State = 'r';
  } // if blue button is clicked (HIGH), blue light will turn on (HIGH) and character 'b' will continually be sent to arduino
  else if (blueButtonMODE == HIGH) {
    digitalWrite(LEDBLUE, HIGH);
    State = 'b';

  } // if yellow button is clicked (HIGH), yellow light will turn on (HIGH) and character 'y' will continually be sent to arduino
  else if (yellowButtonMODE == HIGH) {
    digitalWrite(LEDYELLOW, HIGH);
    State = 'y';

  } else {
    // sets default mode as all buttons are not pressed (LOW), lights are off (LOW) and character 'N' is sent to arduino
    redButtonMODE = LOW;
    blueButtonMODE = LOW;
    yellowButtonMODE = LOW;
    digitalWrite(LEDRED, LOW);
    digitalWrite(LEDBLUE, LOW);
    digitalWrite(LEDYELLOW, LOW);
    State = 'N';
  }
  Serial.print(State); // sends the "State" character to processing
}
