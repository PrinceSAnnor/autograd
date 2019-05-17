//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //sets background color black
  
  stroke (0, 0, 255); //sets rectangle color outline blue
  
  noFill(); //disables rectangle fill color
  
  rect(0, 0, 2559, 1439); //draws rectangle
  
  stroke (0, 0, 255); //sets rectangle color outline blue
  
  fill(0, 255, 0); //fills rectangle green color
  
  rect(2, 2, 20, 100); //draws a rectangle
  
  stroke (0, 0, 255); //sets rectangle color outline blue
  
  fill(0, 255, 0); //fills rectangle green colo
  
  rect(2558, 1438, -20, -100); //draws a rectangle
  
  stroke (255, 0, 0); //sets circle outline color red
  
  fill(250); //fills circle white color
  
  ellipse(1280, 720, 40, 40); //draws a circle
  
  textSize(100); //sets text size to 100
  
  fill(255, 0, 0); //
  
  text("0", 940, 700); //writes text on screen
  
  fill(0, 255, 0); //
  
  text("5", 1560, 700); //writes text on screen
  
}