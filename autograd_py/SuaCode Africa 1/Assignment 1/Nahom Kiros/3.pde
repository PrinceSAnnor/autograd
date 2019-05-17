//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(255); // sets the background white
  
  stroke(0); // sets the outline of the first paddle black
  fill(0,255,0); // colors the inside of the paddle green
  rect(0,0, 50,200); // draws the first paddle
  
  stroke(0); // sets the outline of the second paddle black
  fill(0,255,0); // fills the inside of the second paddle green
  rect(1870,878, 50, 200); // draws the second paddle
  
  stroke(0); // sets the outline of the ball black
  fill(255,0,0); // colors the ball red
  ellipse(950,550, 50,50); // draws the ball
  
  textSize(60); // sets the text size
  fill(255,0,0); // sets the text color
  text("2", 750,550); // writes the text
  
  fill(255,0,0); // sets the text color
  text("4",1150,550); // writes the second text
}
