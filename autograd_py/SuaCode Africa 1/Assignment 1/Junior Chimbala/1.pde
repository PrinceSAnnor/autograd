//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0,0,0); //sets the background black
 
 stroke(255, 0, 255); //sets the colour of the outline of shapes drawn to black
 
 rect(0, 0, 100, 300); //draws a rectangle
 
 stroke(255,0,255); //sets tge outline colour
 
 rect(1179, 419, 100, 300); //draws a rectangle
 
 fill(0, 125, 0); //sets the colour of the rectangle blue
 
 ellipse(600, 300, 100, 100); //draws an ellipse
 
 textSize(50); //sets text size to 50
 
 fill(255); //sets the colour of text to black
 
 text("4", 300,300); //writes text on screen
 
 fill(255); //sets the colour of text
 
 text("1", 800,300); //writes text on screen
 
 fill(255); //sets the colour of text
 }
