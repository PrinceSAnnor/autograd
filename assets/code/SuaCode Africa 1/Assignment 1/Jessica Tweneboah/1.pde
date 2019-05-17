//maxX = 720, maxY = 1480

float screenWidth = 1480; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //sets the background black
  
  
  stroke(255, 0, 0); //sets the color of the outline of the shapes drawn below this code red
  
  
  fill(0, 128, 0); //sets the color of shapes drawn below this code deep green
  
  
  rect(0, 0, 50, 180); //draws a rectangle
  
  
  rect(1430, 540, 50, 180); //draws a rectangle
  
  
  fill(255); //sets the color of shapes drawn below this code white
  
  
  ellipse(740, 360, 60, 60); //draws an ellipse
  
  
  textSize(100); //sets text size to 100
  
  
  fill(255, 255, 0); //sets color of text drawn below this code yellow
  
  
  text("9", 493, 360); //writes text on screen
  
  
  text("4", 987, 360); //writes text on screen
}
