//maxX = 1200, maxY = 720

float screenWidth = 1200; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200); //sets the background grey
  stroke(0,0,128); //sets the color of the outline of shapes drawn below this code deep blue 
  fill(128,0,0); //sets the color of the shape drawn to deep red
  
  rect(0,0,40,200); //draws a paddle at the top left of the graph 
  
  stroke(0,0,128); //sets the color of the outline of shapes drawn below this code deep blue 
  fill(128,0,0); //sets the color of the shape drawn to deep red
  
  rect(1240,520,40,200); //draws a paddle at the right bottom part of the graph
  
  fill(255,0,255); //sets the color of the shape drawn to magenta
  
  ellipse(600,360,50,50); //draw the ball at the center of the graph
  
  fill(0,0,128); //sets the color of the text deep blue
  
  textSize(30); //sets the size of the text to 30
  text("5",450,300); //sets the player one score to 5point
  
  fill(0,0,128); //sets the color of the text deep blue
  
  textSize(30); //sets the size of the text to 30
  text("15",800,350); //sets the score of player two to 15point
  
  
}
