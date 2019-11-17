//copied from the example sketch in Arduino: SerialCallResponse by Tom Igoe
import processing.serial.*;     // import the Processing serial library
Serial myPort;                  // The serial port

float bgcolor;      // Background color
color redOFF;       // color when the red light is off
color redON;        // color when the red light is on
color blueOFF;      // color when the blue light is off
color blueON;       // color when the blue light is on
color yellowOFF;    // color when the yellow light is off
color yellowON;     // color when the yellow light is on
char inByte = 'N';  // initializes the read character from arduino as 'N'

void setup() {
  frameRate(30);    // sets the frame rate to 30 as opposed to 60 
  size(800, 600);   // sets the size of the canvas
  bgcolor = 0;      // sets background color to black
  redOFF = color(200, 100, 100);        // color when the red light is off
  redON = color(255, 0, 0);             // color when the red light is on
  blueOFF = color(75, 100, 175);        // color when the blue light is off
  blueON = color(0, 50, 255);           // color when the blue light is on
  yellowOFF = color(150, 120, 0);       // color when the yellow light is off
  yellowON = color(225, 215, 0);        // color when the yellow light is on
  String portName = Serial.list()[4];   // sets the name of the active port with arduino to portname
  myPort = new Serial(this, portName, 9600);    // creates the object "myPort" and assigns it to the active port with arduino
  smooth();                             // smoothes the graphics


  //fill(redOFF);
  //ellipse (200, height/2, 100, 100);
  //fill(blueOFF);
  //ellipse (400, height/2, 100, 100);
  //fill(yellowOFF);
  //ellipse (600, height/2, 100, 100);
}

void draw() {
  background(bgcolor);                //sets the background color


  inByte = myPort.readChar();          // initializes the variable that is received by Processing from Arduino 

  // if the mouse is in the range of the red elipse or the character sent from Arduino is 'r' then only the red elipse is "on"
  if (((150<=mouseX) && (mouseX<=250) && ((height/2 - 50) <= mouseY) && (mouseY<= (height/2 + 50))) || (inByte == 'r')) {
    fill(redON);
    ellipse (200, height/2, 100, 100);
    fill(blueOFF);
    ellipse (400, height/2, 100, 100);
    fill(yellowOFF);
    ellipse (600, height/2, 100, 100);
    // resets the buffer of Arduino
    myPort.clear();
  } // if the mouse is in the range of the blue elipse or the character sent from Arduino is 'b' then only the blue elipse is "on"

  else if ((350<=mouseX) && (mouseX<=450) && ((height/2 - 50) <= mouseY) && (mouseY<= (height/2 + 50)) || (inByte == 'b') ) {
    fill(redOFF);
    ellipse (200, height/2, 100, 100);
    fill(blueON);
    ellipse (400, height/2, 100, 100);
    fill(yellowOFF);
    ellipse (600, height/2, 100, 100);
    myPort.clear();
  } // if the mouse is in the range of the yellow elipse or the character sent from Arduino is 'y' then only the yellow elipse is "on"

  else if ((550<=mouseX) && (mouseX<=650) && ((height/2 - 50) <= mouseY) && (mouseY<= (height/2 + 50))|| (inByte == 'y')) {
    fill(redOFF);
    ellipse (200, height/2, 100, 100);
    fill(blueOFF);
    ellipse (400, height/2, 100, 100);
    fill(yellowON);
    ellipse (600, height/2, 100, 100);
    myPort.clear();
  } // if the character sent from the Arduino is 'N' then none of the circles are "on"
  
  else if (inByte == 'N') {
    fill(redOFF);
    ellipse (200, height/2, 100, 100);
    fill(blueOFF);
    ellipse (400, height/2, 100, 100);
    fill(yellowOFF);
    ellipse (600, height/2, 100, 100);
    myPort.clear();
  }
}
