**Concept and Description**

  Building on my dog for my midterm, I created a virtual dog that you can interact with. It senses when there is a person and barks, wags its tail faster and starts panting when you pet it and does tricks. It can threten (play growling noise), beg (play whining noise) and play dead (stop the automatic barking). The user can interact with hovering the mouse on the commands on my laptop. The dog is made completely out of cardboard, tape and glue gun with cotton balls used for its fur. 

**System Diagram of Hardware and Software**
 

**Block Diagram**



**Equipment Requirements**
* Distance sensor
* Light sensor
* Servo Motor

**How it Works**

**How it was Built**

**Problems and Solutions **

* Distance sensor
  The distance sensor I used was not the best, I'm wondering if I would've had less bugs if I used the IR sensors rather than this distance sensor. The issue was that it wasn't very accurate and would often get wild readings out of the blue, causing the LEDs to flicker or the servo motor to tunr on for a split second. As a result the dog looked very glichy. To solve this, I limited the times when the servo motor would be called and created a "for-loop" to average out valid readings and use those instead. 
  
* Hardware
  
**Arduino Code**
```
// includes a seperate file for the sweeper function
#include "sweeper.h"
const int LEDYELLOW = 5;// initializes pin for LED
const int LEDYELLOW2 = 6;// initializes pin for LED
const int trigPin = 9;// initializes pin for distance sensor
const int echoPin = 10; // initializes pin for distance sensor
const int lightsensor = A0; // initializes pin for Light sensor
char charState = 'N'; // initializes the variable that is sent to the Arduino in order to communicate to Processing what is going on on the bread board
int distanceCount = 0; // sets distsanceCount for averaging distance readings
int distanceTotal = 0;// sets distsanceTotal for averaging distance readings
int nothing = 0; // null
int ledState = LOW; // initializes LED state as LOW/OFF
unsigned long previousMillis = 0; // initializes millis
const long interval = 1000; // initializes intercal
long duration;
int distanceCm, distanceInch;
Sweeper sweeper1(15); // initializes object type


void setup() {

  sweeper1.Attach(7); // attatches servo motor to pin #7
  Serial.begin (9600); // establishes speed of communication
  //sets pins to arduino
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(LEDYELLOW, OUTPUT);
  pinMode(LEDYELLOW2, OUTPUT);
  pinMode(lightsensor, INPUT);
  pinMode(LEDYELLOWA, OUTPUT);
  pinMode(LEDYELLOWA2, OUTPUT);

}

void loop() {
  //sets us the light sensor as Lsensor
  int Lsensor = analogRead(lightsensor);

  //sets digital sensor pins
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distanceCm = duration * 0.034 / 2; // distance measure in centimeters


  if ((distanceCm > 2) && (distanceCm <= 400)) { // makes sure readings are within a valid range
    distanceTotal = 0;
    //loop takes in 10 valid readings and finds the avergage
    for (distanceCount = 0; distanceCount < 10;) {
      distanceTotal = (distanceTotal + distanceCm);
      distanceCount = distanceCount + 1;
    }

    distanceCm = (distanceTotal / 10); // sets new averagesd distance reading
    if (distanceCm < 120) { // if something is sensed withint 120cm
      if (Lsensor < 800) {// if the dog is being "pet" (light sensor is covered)
        //increase increment (wagging of tail)
        charState = 'P'; // P = Panting; panting sound and faster wagging of tail
        // increases speed of tail waggin
        sweeper1.Attach(7);
        sweeper1.Increase();
        sweeper1.Update();
        unsigned long currentMillis = millis();
        // turns off LEDs
        digitalWrite(LEDYELLOW, LOW);
        digitalWrite(LEDYELLOW2, LOW);

      } else {
        charState = 'B'; // B = barking, but no happy wagging of tail (will alternate between barking and painting)
        unsigned long currentMillis = millis();
        // turns on LEDs
        digitalWrite(LEDYELLOW, HIGH);
        digitalWrite(LEDYELLOW2, HIGH);
      }

    } else {
      // if nothing is sensed within the valid range, all items will turn off
      sweeper1.Detach();
      digitalWrite(LEDYELLOW, LOW);
      digitalWrite(LEDYELLOW2, LOW);
      charState = 'N';
    }
    Serial.print(charState); //sends character state to processing as inByte
    delay(20);
  }
}

```

**Processing Code**

```
// allows audio to be played from processing
import processing.sound.*;
//copied from the example sketch in Arduino: SerialCallResponse by Tom Igoe
import processing.serial.*;     // import the Processing serial library
Serial myPort;                  // The serial port


SoundFile bark; 
SoundFile panting;
SoundFile whine;
SoundFile threaten;
boolean barkState = false; //used to test if the bark audio is playing
boolean pantingState = false; //used to test if the panting audio is playing
boolean whineState = false; //used to test if the whine audio is playing
boolean threatenState = false; //used to test if the growling audio is playing
char charState;    //dictates the "mode" that the dog is now in and selects and audio to play
color pink = color(255, 207, 207); // creates the color pink
PImage speak; //initializes the command image "threaten"
PImage beg; //initializes the command image "beg"
PImage playdead; //initializes the command image "play dead"
PImage instructions; //initializes the image for instuctions
PImage sorry;  //initializes the  image for an apology by the dog connected to the play dead trick
int ymargin = 300; // initializes the ymargin for the images
int xmargin = 100;// initializes the xmargin for the images
int commandWidth = 500; // initializes the default width for the tricks 
int commandHeight = 200; // initializes the default height for the tricks
char inByte; // used to communicate with Adruino
int nope; // used to create content for an else statement

void setup() {


  size (1400, 1000); // creates the canvas
  background(pink); // sets the background as pink
  String portName = Serial.list()[4];   // sets the name of the active port with arduino to portname
  myPort = new Serial(this, portName, 9600);    // creates the object "myPort" and assigns it to the active port with arduino
  bark = new SoundFile (this, "barking.mp3"); // sets the audiofile for the bark sequence
  panting = new SoundFile (this, "panting.mp3"); // sets the audiofile for the panting sequence
  whine = new SoundFile (this, "whinning.mp3"); // sets the audiofile for the whinning sequence
  threaten = new SoundFile (this, "threaten.mp3"); // sets the audiofile for the growling sequence
  speak = loadImage("threaten.PNG"); // sets the image for the threaten command 
  beg = loadImage ("beg.PNG"); // sets the image for the beg command 
  playdead = loadImage("playdead.PNG");// sets the image for the play dead command 
  instructions = loadImage("instructions.png"); // sets the image for the instructions
  sorry = loadImage("sorry.png"); // sets the image for the apology
  image(speak, xmargin, ymargin, commandWidth, commandHeight); // displays the images
  image(beg, (xmargin + commandWidth + 100), ymargin, commandWidth, commandHeight);
  image (playdead, (width/2 - commandWidth/2), (ymargin + commandHeight + 100), commandWidth, commandHeight);
  image (instructions, 0, 0, 1400, 200);
}

void draw() {

  inByte = myPort.readChar(); // reads the characrwr being sent by the arduino
  if ((inByte =='P')||(inByte =='B')||(inByte =='H')) { // makes sure to not use any character that isn't necessary by the Processing code  
    //re-draws the commands and the background every loop
    background(pink);
    image(speak, xmargin, ymargin, commandWidth, commandHeight);
    image(beg, (xmargin + commandWidth + 100), ymargin, commandWidth, commandHeight);
    image (playdead, (width/2 - commandWidth/2), (ymargin + commandHeight + 100), commandWidth, commandHeight);
    image (instructions, 0, 0, 1400, 200);
    // checks if mouse is hovering over the beg command 
    if (((xmargin+commandWidth+100)<=mouseX) && (mouseX<=(commandWidth + xmargin+commandWidth+100)) && (ymargin <= mouseY) && (mouseY<= (ymargin + commandHeight))) {
      charState = 'w'; 
      // makes sure that all other audio stop playing
      threaten.stop();
      panting.stop();
      bark.stop();
      myPort.clear();
    } else if ((xmargin<=mouseX) && (mouseX<=(commandWidth + xmargin)) && (ymargin <= mouseY) && (mouseY<= (ymargin + commandHeight))) {
      charState = 't';
      // makes sure that all other audio stop playing
      whine.stop();
      panting.stop();
      bark.stop();
      myPort.clear();
      // checks if the arduino is sending the character "B"
    } else if (inByte == 'B') {
      charState = 'b';
      // makes sure that all other audio stop playing
      whine.stop();
      panting.stop();
      threaten.stop();
      myPort.clear();
      // checks if the arduino is sending the character "P"
    } else if (inByte == 'P') {
      charState = 'p'; 
      // makes sure that all other audio stop playing
      bark.stop();
      whine.stop();
      threaten.stop();
      myPort.clear();
    } else {
      // stops all audio from playing if no communication is detected between processing and arduino
      bark.stop();
      whine.stop();
      panting.stop();
      threaten.stop();
      //charState = 'n';
      myPort.clear();
    }

    // the loops below set loops for playing the audio and is the same for each character state
    if (charState == 'b') { // if a certain character is sensed (can be b, p, w, and t the the loop is entered
      if (bark.isPlaying()) {// first checks if the audio is already playing
        barkState = true; // if the audio is playing, barkState is true and the audio is not queued to play again
      } else if (barkState == false) {// if the the audio is not playing
        bark.cue(20); // bark soundfile is cued at 20 seconds
        bark.play(); // (rate, pos, amp, add, cue) // and played
      } else {
        barkState = false;
      }
    } 

    if (charState == 'p') {
      if (panting.isPlaying()) {
        pantingState = true;
      } else if (pantingState == false) {
        panting.play();
      } else {
        pantingState = false;
      }
    }

    if (charState == 'w') {
      if (whine.isPlaying()) {
        whineState = true;
      } else if (whineState == false) {
        whine.play();
      } else {
        whineState = false;
      }
    }

    if (charState == 't') {
      if (threaten.isPlaying()) {
        threatenState = true;
      } else if (threatenState == false) {
        threaten.play(); // (rate, pos, amp, add, cue)
      } else {
        threatenState = false;
      }
    } 
    print(inByte);
    myPort.clear();
  } else {
    nope = 0;
  }
}
```



