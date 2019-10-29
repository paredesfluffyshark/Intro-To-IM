
size(800, 500);
background(255);
int ylimit1 = 10;
int ylimit2 = 490;
println("ylimit1 " + ylimit1);
// making "canvases"
for (int canvasesprinted = 0; canvasesprinted <= 2; canvasesprinted = canvasesprinted + 1) {
  println("canvasesprinted " + canvasesprinted);
  int xlimit1 = 12 + ((250*canvasesprinted) + (15*canvasesprinted));
  println("xlimit1 " + xlimit1);
  int xlimit2 = 260 + ((250*canvasesprinted)+ (12*canvasesprinted));
  println("xlimit2 " + xlimit2);
  // filling first
  float numberofsquaresfloat = (random(2, 5));
  int numberofsquares = int(numberofsquaresfloat);
  println("squares " + numberofsquares);

  float numberofcirclesfloat = (random (2, 5));
  int circles = int(numberofcirclesfloat);
  println("cirlces " + circles);

  float numberoftrianglesfloat = (random (2, 5));
  int numberoftriangles = int(numberoftrianglesfloat);
  println("triangles " + numberoftriangles);

  for (int square = 0; square <= numberofsquares; ) {
    float xvalue = random(xlimit1, xlimit2);
    float yvalue = random(ylimit1, ylimit2);
    float squaresize = random (50, 200);
    // making sure that the squares are within the first canvas
    if ((xvalue + squaresize) < xlimit2) {
      if ((yvalue + squaresize) < ylimit2) {
        stroke(0);
        noFill();
        rect (xvalue, yvalue, squaresize, squaresize);
        square = square + 1;
      }
    }
  }
  // filling second canvas with triangles
  for (int triangle = 0; triangle <= numberoftriangles; triangle = triangle + 1) {
    float xvalue1 = random(xlimit1, xlimit2);
    float yvalue1 = random(ylimit1, ylimit2);
    float xvalue2 = random(xlimit1, xlimit2);
    float yvalue2 = random(ylimit1, ylimit2);
    float xvalue3 = random(xlimit1, xlimit2);
    float yvalue3 = random(ylimit1, ylimit2);

    stroke(0);
    noFill();
    triangle (xvalue1, yvalue1, xvalue2, yvalue2, xvalue3, yvalue3);
    //creating the circles
  }
  // circles
  for (int circle = 0; circle <= circles; ) {
    float xvalue = random(xlimit1, xlimit2);
    float yvalue = random(ylimit1, ylimit2);
    float circlesize = random (50, 200);
    // making sure that the squares are within the first canvas
    if ((xvalue + circlesize/2) < xlimit2) {
      println ("xvalue + circleze/2 = " + (xvalue + circlesize/2));
      if ((yvalue + circlesize/2) < ylimit2) {
        println ("yvalue + circleze/2 = " + (yvalue + circlesize/2));
        if ((xvalue - circlesize/2) > xlimit1) {
          println ("xvalue - circleze/2 = " + (xvalue - circlesize/2));
          if ((yvalue - circlesize/2) > ylimit1) {
            println ("yvalue - circleze/2 = " + (yvalue - circlesize/2));
            stroke(0);
            noFill();
            ellipse (xvalue, yvalue, circlesize, circlesize);
            circle = circle + 1;
          }
        }
      }
    }
  }





  for (int rectangle = 0; rectangle < 3; rectangle = rectangle +1) {
    stroke (0);
    noFill();
    rect (10 + (265*rectangle), 10, 250, 480);
  }
}
