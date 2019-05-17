//maxX = 2220, maxY = 1080

float screenWidth = 2220; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//Sets the background black
  stroke(0,0,255);//Sets the color of the outline of the top left shape drawn below as blue
  fill(0,255,0);//Sets the color of the top left shape drawn as green
  rect(20,0,150,300);//Draws a rectangle for the top left
  stroke(0,0,255);//Sets the color of the bottom right shape drawn below as blue
  fill(0,255,0);//Sets the color of the bottom right shape dawn below as green
  rect(2060,780,150,300);//Draws a rectangle for the bottom right
  stroke(0,0,255);//Sets the color of the outline of the drawn below as blue
  fill(255,255,255);//Sets the color of the shape drawn below as white
  ellipse(1110,540,50,50);//Draws an ellipse
  textSize(90);//Sets text size as 90 
  text("0",800,560);//Writes text on screen which represents the left players' score 
  textSize(90);//Sets text size as 90
  text("5",1400,570);//Writes text on screen which represents the right playeys' score
  
  
  
}
