//maxX = 1024, maxY = 600

float screenWidth = 1024; //set to your maxX
float screenHeight = 600; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the > to run in full screen mode
  
}

void draw() //runs forever

{
  
  background(0); //runs the background black
  
  rect(0,0,96,200); //draws a rectangl
  
  rect(888,400,200,300); // draws the second rectangle
  
  
  ellipse(512,300,50,50); //draws ellipses
  fill(0,255,0); // color green
  
  
  text("0", 470,300); //writes 1 on screen
  
  text("5", 550,300); // write 2 on the screen
  
  textSize(20); //sets text size to 20
  
}
