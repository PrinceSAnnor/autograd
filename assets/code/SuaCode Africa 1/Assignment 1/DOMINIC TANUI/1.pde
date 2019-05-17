//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,128,0); //sets the background jungle green
  stroke(255,255,255); //sets the color of the outline of the shapes drawn below this code white
  fill(128,0,0); //sets the color of the code drawn below this code maroon
  rect(0,0,65,120); //draws a rectangle
  rect(1375,600,65,120); //draws rectangle
  fill(0,0,0); //sets the color of the shapes drawn below this code black
  ellipse(720,360,50,50); //draws an ellipse
  text("2",390,360); //writes text on screen
  text("9",1060,360); //writes text on screen
  textSize(50); //sets text size to 50
  }
