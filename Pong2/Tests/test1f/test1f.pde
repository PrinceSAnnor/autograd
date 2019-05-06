//maxX = ... 1920  .., maxY = 1080

int rectX, rectY, rectA, rectB, rectWidth, rectHeight;//declares variables for paddles
int ballX, ballY, diameter;//declares variables for the ball
int playerX, playerY;
float textWidthX, textWidthY; //
int textHeightX, textHeightY;//declares variables for players scores
int tSize;
int ballXSpeed, ballYSpeed;//declares the movement of ball
 
void setup() //runs once
{
  size(1920, 1080); //sets the width and height of the program  
  rectX = 0; 
  rectY = 0;
  rectA = 1872; 
  rectB = 864;
  rectWidth = 48;
  rectHeight = 216; //initializes the variables created for the paddles
  ballX = 960; 
  ballY = 540;
  diameter = 20;//initializes the variables for the ball
  ballXSpeed = 3;
  ballYSpeed = 3;//initializes ball speed at certain direction and speed
  playerX = 6; 
  playerY = 2; 
  textWidthX=480; 
  textHeightX=540;
  textWidthY=1440; 
  textHeightY=540;//initializes variables for the ball
  tSize = 25; //initializes textsize
}

void draw() //runs continually
{
  background(87);//sets the background colour to gray
  fill(0,0,255);//sets the interior of paddles to blue
  stroke(0,128,0);//sets outline to green
  rect(rectX,rectY, rectWidth, rectHeight); //draws a rectangle 
  rect(rectA,rectB, rectWidth, rectHeight); //draws a rectangle at the other end.
  
  fill(255,0,0);//sets ellipse to red
  ellipse(ballX, ballY, diameter, diameter);//to draw ellipse
  
  textSize(tSize); //set text size to 25
  text(playerX, textWidthX, textHeightX); //writes text on screen
  text(playerY, textWidthY, textHeightY); //writes text score on other side of screen
  
  ballX = ballX + ballXSpeed;//increases ball movement to right
  ballY = ballY + ballYSpeed;//increases ball movement up
}
