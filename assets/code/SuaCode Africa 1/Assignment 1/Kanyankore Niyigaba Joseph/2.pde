//maxX = 960, maxY = 540

float screenWidth = 960; //set to your maxX
float screenHeight = 540; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw( ) //runs forever
{
  background(0, 0, 0);  // sets the background=black
  
  
  stroke(0, 0, 255); // shapes/outlines - blue(below)
  
  
  fill(0, 255, 0); // green paddle 1
  
  
  rect(0, 0, 30, 130); // draw green paddle 1
  
  
  fill(0, 255, 0); // green paddle 2
  
  
  rect(930, 410, 30, 130); // draw green paddle 2
  
  
  fill(255); // white ball
  
  
  ellipse(480, 270, 25, 25); // draw (w) ball
  
  
  textSize(47); // set text size to 47
  
  
  fill(255, 255, 255); // white for text
  
  
  text("0", 356, 270); // 0 at (356,270)
  
  
  text("5", 597, 269); // 5 at (597,269)
 
}
