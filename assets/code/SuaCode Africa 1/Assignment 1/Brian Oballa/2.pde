//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200); //sets the background grey
  
  rect(0,0,30,60); //draws rectangle
  
  stroke(255,255,0); // sets outline colour of shape to yellow
  
  fill(0,0,255); // sets interior colour of shape to blue
  
  rect(824,420,30,60); //draws rectangle
  
  stroke(255,255,0); // sets outline colour of shape to yellow
  
  fill(0,0,255); // sets interior colour of shape to blue
  
  ellipse(427,240,40,40); //draws ellipse
  
  textSize(30); //sets text size to 30
  
  text("69",300,250); //writes text on screen
  
  text("06",524,250); //writes text on screen
  
}
