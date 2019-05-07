//maxX = 1280, maxY = 800

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(200);  //sets the background grey
  
  stroke (0, 255, 0);
  fill (255, 0, 0);

  rect(0, 50, 640, 115); //draws a rectangle

  fill (0, 255, 255);


  ellipse(320, 400, 80, 80); //draws an ellipse


  textSize(20); //set text size to 20
  fill (0);

  text("This is my first program", 50, 200); //writes text on screen
}
