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
  
  stroke (0, 0, 128); //sets rectangle color outline blue
  
  noFill(); //disables rectangle fill color
  
  rect(0, 0, 2559, 1439); //draws a rectangle
  
  stroke (0, 0, 128); //sets rectangle color outline blue
  
  fill(0, 128, 0); //fills rectangle green color
  
  rect(2, 2, 20, 150); //draws a rectangle
  
  stroke (0, 0, 128); //sets rectangle color outline blue
  
  fill(255, 0, 0); //fills rectangle color red
  
  rect(2558, 1438, -20, -150); //draws a rectangle
  
  stroke (0, 0, 128); //sets circle outline color blue
  
  fill(250); //fills circle white color
  
  ellipse(1280, 720, 40, 40); //draws a circle
  
  textSize(100); //sets text size to 100
  
  fill(255, 0, 0); //fills text color red
  
  text("0", 940, 720); //writes text on screen
  
  fill(0, 255, 0); //fills text green color
  
  text("5", 1560, 720); //writes text on screen
  
}