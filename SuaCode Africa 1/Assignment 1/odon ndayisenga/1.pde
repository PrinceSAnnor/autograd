//maxX = 1420, maxY = 710

float screenWidth = 1420; //set to your maxX 
float screenHeight = 710; //set to your maxY 

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //sets the background black
  stroke(0, 255, 0); //sets the color of shapes drawn below below this code below green
  fill(0, 128, 0); //sets the color of shapes drawn below this code green
  rect(0, 0, 40, 100); //draws a rectangle
  fill(255, 255, 255); //sets the color of shapes below this code light blue
  ellipse(700, 340, 40, 40); //draws an allipse
  textSize(20); //sets text size
  fill(255, 255, 255); //sets the color of text drawn below this code black 
  text("0", 650, 340); //write text on screen
  text("5", 750, 340); //wrire text on screen
  fill(0, 128, 0); //sets the color of shapes drawn below this code green
  rect(1380, 610,  40, 900); //draws a rectangle
  
}
