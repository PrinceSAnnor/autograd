//maxX = 1456, maxY = 720

float screenWidth = 1456; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(100,200,100); //sets the background colour light green
  stroke(255); //sets the outline of the shapes drawn below this code white
  fill(70,0,150); //sets the colour the shapes drawn below this code light blue
  rect(0,0,50,200); //draws a rectangle
  rect(1406,520,50,200); //draws a rectangle
  stroke(255); //sets the colour of the outlines of the shape drawn below this code white
  fill(255); //sets the colour of the shapes drawn below this code white
  ellipse(728,360,50,50); //draws an ellipse
  textSize(50); //sets the size of the text 50
  fill(0); //sets the text colour black
  text("10", 364,370); //writes 10 on the screen
  text("7", 1092,370); //writes 7 on the screen
}
