//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(5); // sets bakground black
  
  stroke(0, 200, 200); // sets outline of shape drawn below this code seablue
  
  fill(0, 255, 0); // sets color of shape drawn below this code green
  rect(0, 0, 40, 100); //draws a rectangle
  rect(814, 380, 40, 100); // draws a rectangle
  
  fill(255, 255, 0); //sets color of shape drawn below this code blue
  ellipse(427, 240, 30, 30); //draws an ellipse
  
  fill(255, 0, 0); //sets the color of texts below this code red
  textSize(20); //sets text size to 10
  text("4", 100, 20); //writes text on screen
  text("11", 754, 20); // writes text on screen 
} 