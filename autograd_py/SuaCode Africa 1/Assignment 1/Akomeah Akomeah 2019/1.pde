//maxX = 960, maxY = 480

float screenWidth = 960; //set to your maxX
float screenHeight = 480; //set to your maxY


void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
    background(255,255,255);  //sets the background green
  
    
{
    stroke(0,0,0); //sets the outline of shapes drawn below this  black
   
    fill(255,0, 255); //sets the color of shapes drawn below this code red

    rect(0,0,50, 200); //draws a rectangle
 
    rect(910,300,50, 200); //draws a rectangle
}
   
{
    fill(0, 255, 0); //sets the color of shapes drawn below this code red
  
    ellipse (450, 200, 25, 25); //draws an ellipse
}
  
   
{
    textSize(30); //set text size to 30

    fill(0, 0, 0); //sets the color of shapes drawn below this code red

    text(                 "0                                      3", 300, 215); //writes text on screen
}

}
