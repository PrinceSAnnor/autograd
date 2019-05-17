//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(255,0,255); //sets background pink
  
  stroke(255,255,255); //sets the colour of the outline of shapes drawn below this code to white
  
  fill(0,255,0); //sets the colour of shapes drawn below this code green
  
  rect(0,0,150,540); //draws a rectangle
  
  rect(1760,540,150,540); //draws a rectangle
  
  stroke(255,255,255); //sets the colour of the outline of shapes drawn below this code to white
  
  fill(255,255,0); //sets the colour of shapes drawn below this code to yellow
  
  ellipse(960,540,135,135); //draws an ellipse
  
  textSize(100); //sets the text size to 100
  
  fill(0,0,255); //sets the colour of text drawn below this code to blue
  
  text("33",680,540); //writes text on screen
  
  text("17",1140,540); //writes text on screen
}
