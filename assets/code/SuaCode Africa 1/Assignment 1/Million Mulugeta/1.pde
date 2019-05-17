//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); // sets background bkacj
 stroke(0,255,0); //sets the color of the outline of shapes drawn below this code below green
  fill(0,255,0); //sets the color of paddles to green
  rect(3,10,20,100); // draws the left paddle
  rect(830,380,20,100); // draws right paddle
  fill(0,255,255); // sets the color to light blue
  ellipse(427,240,40,40); // draws the ball of pong game
  fill(255,255,255); //sets the color of text drawn below this code black
  textSize(40); //sets text size
  text("2",347,245); //score of player one
  text("6",477,245); //score of player two
}
