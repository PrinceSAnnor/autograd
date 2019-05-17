//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(180); //sets the background grey 
  
  stroke(0,0,250); //sets the colour of the outline of shapes drawn below this code blue 
  
  fill(255,0,0); //sets the colour of the shapes drawn below this code red 
  
  rect(0,0,30,100); //draws a rectangle 
  
  rect(1410,620,30,100); //draws a rectangle 
  
  fill(0,250,0); //sets the colour of the shapes drawn below this code green 
  
  ellipse(720,360,50,50); //draws an ellipse 
  
  textSize(35); //sets text size to 35 
  
  fill(0); //sets the colour of shapes drawn below this code black 
  
  text("7",450,360); //writes text on the screen 
  
  text("4",990,360); //writes text on the screen 
  
}
