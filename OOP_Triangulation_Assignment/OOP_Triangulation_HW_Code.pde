// creating the class "canvas"
class Canvas {
  int xleftside, xrightside, ytop, ybottom, squares, circles, triangles, Cwidth, Cheight;
  Canvas(int l, int r, int yt, int yb, int s, int c, int t) {
    xleftside = l; // dictates the left side of the printed canvas
    xrightside = r; // dictates the right side of the printed canvas
    ytop = yt; //dictates the top of the printed canvas
    ybottom = yb; // dictates the bottom of the printed canvas
    squares = s; // dictates the number of squares that will be printed on the canvas
    circles = c; // dictates the number of circles that will be printed on the canvas
    triangles = t; // dictates the number of triangles that will be printed on the canvas
    Cwidth = r - l; // dictates the width of the canvas
    Cheight = yb - yt ; // dictates the height of the canvas
  }
  // method to make the print the canvas
  void createCanvas() {
    stroke (0);
    noFill();
    rect (xleftside, ytop, Cwidth, Cheight); // creates the canvas based on the parameters stated when the object is created
   
  }
  void drawCircle() {
    // method to draw the circles
    for (int circle = 0; circle < circles; circle = circle ) {
      // xvalue is a randomly generated x value for the circle
      float xvalue = random(xleftside, xrightside);
      // yvalue is a randomly generated y value for the circle
      float yvalue = random(ytop, ybottom);
      // randomly generates circles size
      float circlesize = random (50, 200);
      // making sure that the circles are within the first canvas
      if ((xvalue + circlesize/2) < xrightside) {
        if ((yvalue + circlesize/2) < ybottom) {
          if ((xvalue - circlesize/2) > xleftside) {
            if ((yvalue - circlesize/2) > ytop) {
              // creates the cirlce
              stroke(0);
              noFill();
              ellipse (xvalue, yvalue, circlesize, circlesize);
              circle = circle + 1;
            }
          }
        }
      }
    }
  }

  void drawTriangle() {
    // filling with triangles
    // randomly generating the 6 x and y values each of the points of the triangle
    for (int triangle = 0; triangle < triangles; triangle = triangle + 1) {
      float xvalue1 = random(xleftside, xrightside);
      float yvalue1 = random(ytop, ybottom);
      float xvalue2 = random(xleftside, xrightside);
      float yvalue2 = random(ytop, ybottom);
      float xvalue3 = random(xleftside, xrightside);
      float yvalue3 = random(ytop, ybottom);
      
      //prints the triangle
      stroke(0);
      noFill();
      triangle (xvalue1, yvalue1, xvalue2, yvalue2, xvalue3, yvalue3);
      //creating the circles
    }
  }

  void drawSquare() {
    
    // filling with squares
    for (int square = 0; square < squares; ) {
      // xvalue is a randomly generated x value for the square
      float xvalue = random(xleftside, xrightside);
      // xvalue is a randomly generated y value for the square
      float yvalue = random(ytop, ybottom);
      // randomly generates circles size
      float squaresize = random (50, 200);
      // making sure that the squares are within the first canvas
      if ((xvalue + squaresize) < xrightside) {
        if ((yvalue + squaresize) < ybottom) {
          // prints the square
          stroke(0);
          noFill();
          rect (xvalue, yvalue, squaresize, squaresize);
          // dictates the number of squares printed
          square = square + 1;
        }
      }
    }
  }
}

//creating the 4 canvases (objects)
Canvas canvas1 = new Canvas(10, 210, 10, 210, 0, 0, 3);
Canvas canvas2 = new Canvas(220, 790, 10, 320, 3, 3, 3);
Canvas canvas3 = new Canvas(10, 390, 330, 490, 5, 0, 0);
Canvas canvas4 = new Canvas(400, 790, 330, 490, 0, 5, 0);

void setup() {
  size(800, 500);
  background(255); 

  canvas1.createCanvas();
  canvas1.drawTriangle();

  canvas2.createCanvas();
  canvas2.drawCircle();
  canvas2.drawSquare();
  canvas2.drawTriangle();

  canvas3.createCanvas();
  canvas3.drawSquare();

  canvas4.createCanvas();
  canvas4.drawCircle();
}
