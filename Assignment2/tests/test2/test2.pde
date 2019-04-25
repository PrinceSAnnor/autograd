//maxX = ... 1920  .., maxY = 1080

int leftPadX;//declare variable to hold position X of left paddle 
int leftPadY; //declare variable to hold position Y of left paddle 
int padWidth; //declares width of both paddles

float rightPadX;//declare variable to hold position X of right paddle 
float rightPadY;//declare variable to hold position Y of right paddle
int padHeight; //declares height of both paddles

int ballX;//declare variable to hold X position of ball
float ballY;//declare variable to hold Y position of ball
float diameter=30;//declare and initialise variable to hold size of ball

int playerX;//declares playerX score
float playerWidthX;//declare variable to hold width of playerX score
int playerHeightX;//declare variable to hold height of playerX score

int playerY; //declares player Y score
float playerWidthY; //declare variable to hold width of playerY
int playerHeightY; //declare variable to hold height of playerY
int textSize=40;//declare and initialise variable to hold size of score

int ballSpeedX, ballSpeedY;

void setup() //runs once
{
  size(1920, 1080);
  
  leftPadX=0;
  leftPadY=0;
  
  rightPadX=1872;
  rightPadY=864;
  
  padWidth=width/50;
  padHeight=height/6;
  
  ballX = 960;
  ballY = 540;
  
  playerX=3;
  playerY=2;
  
  padWidth = 48;
  padHeight = 216;
  
  playerWidthY=1440;
  playerHeightY=540;
  
  playerWidthX=480;
  playerHeightX=1440;
  
  ballSpeedX = 2;
  ballSpeedY = 2;
}

void draw()//runs forever
{
  background(126,126,126);//sets background grey
  stroke(125);//sets outline white
  
  fill (0);//sets ball black
  ellipse(ballX,ballY,diameter,diameter);//creates ball with variables 
  
  //Move ball down and left
  ballX = ballX + ballSpeedX; //move ball in x direction
  ballY = ballY + ballSpeedY; //move ball in y direction
  
  fill(0,255,255);//sets paddles sea blue
  rect(leftPadX,leftPadY,padWidth,padHeight);//creates left paddle with variables 
  rect(rightPadX,rightPadY,padWidth,padHeight);//creates right paddle with variables 
  
  fill(255,255,0);//sets scores yellow
  //stroke (0, 25, 255); //use a blue outline for all shapes
  textSize(textSize);//sets scores size to 40 with variables 
  text(playerX,playerWidthX,playerHeightX);//writes player X score on screen with variables
  text(playerY,playerWidthY,playerHeightY);//writes player Y score on screen with variables 
}
