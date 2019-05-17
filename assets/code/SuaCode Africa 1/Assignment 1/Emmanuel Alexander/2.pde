//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0,0,0);  //sets the background grey
  
  stroke(0,0,255); //sets the color of the outline of the shapes drawn below this code below green 
  
  fill(255,255,255); //sets the color of the shapes drawn below this code red 
  rect(0,0,50,135); //draws a rectangle 
  rect(1230,585,50,135); //draws a rectangle
  
  fill(255,0,0); //sets the color of shapes drawn below the code light blue
  ellipse(640, 360, 50, 50); //draws an ellipse
  
  textSize(50); //set text size to 20
  
  fill(255,255,255); //sets the color of the text drawn below this code black
  text(10, 320, 360); //writes text on screen
  text(8, 960, 360);  //writes text on screen 
  
 }