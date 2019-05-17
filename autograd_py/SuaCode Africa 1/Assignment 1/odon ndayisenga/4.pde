//maxX = 1428, maxY = 720

float screenWidth = 1428; //set to your maxX 
float screenHeight = 720; //set to your maxY 

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200); //sets the background grey
  stroke(0, 255, 0); //sets the color of shapes drawn below below this code below green
  fill(255, 0, 0); //sets the color of shapes drawn below this code red
  rect(0, 30, 960, 135); //draws a rectangle
  fill(0, 255, 255); //sets the color of shapes below this code light blue
  ellipse(480, 540, 50, 50); //draws an allipse
  textSize(20); //sets text size
  fill(0); //sets the color of text drawn below this code black 
  text("this is my first program", 20, 270); //write text on screen
  
}
