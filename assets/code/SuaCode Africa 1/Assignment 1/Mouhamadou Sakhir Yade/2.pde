//maxX = 1024, maxY = 600

float screenWidth = 1024; //set to your maxX
float screenHeight = 600; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //sets the background black
  stroke(255,255,255); //sets the color of the outline of shapes drawn below this code below white
  fill(255,0,0); //sets the color of shapes drawn below this code red
  rect(10,10,500,250); //draw a rectangle
  fill(0,255,255); //sets the color of shapes drawn below this code light blue
  ellipse(200,200,300,250); //draw an ellipse
  fill(0,255,0); //sets the color of text below this code green
  textSize(50); //set text size to 50
  text("this is my first progam",200,100); //writes text on screen
  
}