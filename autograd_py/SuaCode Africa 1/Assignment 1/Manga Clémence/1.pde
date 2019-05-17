//maxX = 720, maxY = 1440

float screenWidth = 720; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0, 0, 0); //sets the background black
  
  
  stroke(255, 255, 0); //sets the color of the outline of shapes drawn below this code navy blue
  
  fill(0, 128, 0); //sets the color of the shapes drawn below this code green
  
  rect(0, 0, 100, 300); //draws a rectangle
  
  stroke(255, 255, 0); //sets the color of the outline of shapes drawn below this code navy blue
  
  fill(0, 128, 0); //sets the color of the shapes drawn below this code green
  
  rect(1200, 420, 100, 300); //draws a rectangle 
  
  
  stroke(255, 0, 0); //sets the color of the outline of shapes drawn below this code white
  
  fill(255, 255, 255); //sets the color of shapes drawn below this code white
  
  ellipse(700, 350, 50, 50); //draws an ellipse
  
  
  textSize(20); //sets text size to be 20
  
  fill(255, 255, 255); //sets color of the text drawn below this code white
  
  text("3", 500, 300); //writes text on screen
  
  textSize(20); //sets text size to be 20
  
  fill(255, 255, 255); //sets color of the text drawn below this code white
  
  text("6", 800, 300); //writes text on the screen
  
}
