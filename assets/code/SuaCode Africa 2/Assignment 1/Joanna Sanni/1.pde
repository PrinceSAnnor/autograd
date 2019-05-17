//maxX = 854, maxY = 480

float screenWidth = 500; //set to your maxX
float screenHeight = 1000; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever 
{
  background (200); //sets the background black
  stroke(128,128,128); //sets the color of the outline of shapes drawn below this code grey
  fill(0,255,255); //sets the color of shapes drawn below this code light blue
  rect(0,0,50,100); //draws a rectangle
  rect(805,380,50,100); //draws a rectangle
  fill(255,0,255); //sets the color of shapes drawn this code purple
  ellipse(427,240,30,30); //draws an ellipse
  textSize(20); //set text size to 20
  fill(0); //sets the color of text drawn below this code black
  text("7", 300,250); //writes text on screen
  text("5", 540,250); //writes text on screen
}
