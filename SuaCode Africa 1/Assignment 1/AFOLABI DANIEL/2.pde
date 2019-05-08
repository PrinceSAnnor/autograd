//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(125, 0, 0);  //Sets the background to shades of red
  
  
  fill(0, 0, 128);  //Sets color of shape below the code to dark blue
  stroke(255, 0, 255);  //Sets outline of shape below the code to purple
  rect(2, 2, 300, 50);  //draws a rectangle signifying the first paddle
  rect(1138, 668, 300, 50);  //draws a rectangle signifying the second paddle
  
  
  fill(0, 255, 25);  //Sets color of shape below to light green
  ellipse(720, 360, 40, 40);  //draws a circle signifying the ball
  
  
  textSize(40);  //Set text size to 40
  
  fill(255, 255, 0);  //Sets color of text below to yellow;
  text("7", 720, 240);  //writes text on the screen
  text("4", 720, 480);  //writes text on the screen
  
}
