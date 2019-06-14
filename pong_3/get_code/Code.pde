class Code {
//maxX = 1920, maxY = 1080

float screenWidth = 1920; //maxX
float screenHeight = 1080; //maxY

float xBall = 960; //x position of the ball 
float yBall = 540; //y position of the ball 
float diameter = 50;  //diameter of the ball
float leftPaddleX = 0; //x coordinate of the left paddle in the top left corner 
float leftPaddleY = 0; //y coordinate of the left paddle in the top left corner
float rightPaddleX = 1872; //x coordinate of the right paddle in the bottom right corner
float rightPaddleY = 864; //y coordinate of the right paddle in the bottom right corner
int paddleHeight = 216; //height of the paddle
int paddleWidth = 48; //width of the paddle
int leftScore = 0; //score of the left player
int rightScore = 0; //score of the right player
float leftScoreX = 480; //x coordinate of the left player's score
float leftScoreY = 540; //y coordinate of the right player's score
float rightScoreX = 1440; //x coordinate of the right player's score
float rightScoreY = 540; //y coordinate of the right player's score
float xSpeed = 20; //horizontal speed of the ball
float ySpeed = 20; //vertical speed of the ball
float radius = 25; //radius of the ball
int tSize = 30; //Sets the text size
boolean gameOn = false;

void once()
{
  size(1920, 1080); //sets the width and height of the program
}

void forever()
{
  background (0); //set background to black each frame
  stroke (0, 0, 255); //use a blue outline for all shapes until stroke is run again with another color
  
  //Draw ball
  //ellipse (xBall, yBall, diameter, diameter); //draw ball unto the screen 
  
  //Draw paddles
  fill (0, 255, 0); //fill all shapes to green until fill is run with another color 
  rect (leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //draw left paddle
  rect (rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //draw right paddle
  
  //Write scores to screen
  textSize(tSize); //set size of the player's scores to be the value in the tSize variable
  fill (255); //fill all shapes to white until fill is run with another color 
  text (leftScore, leftScoreX, leftScoreY); //draw left player'sscore 
  text (rightScore, rightScoreX, rightScoreY); //draw right player's score 
  
  if(mousePressed) 
  {
    gameOn = true; 
  }
  
  //Move ball if game is on 
  if (gameOn) {
    xBall = xBall + xSpeed; //increase the x position of the ball by x speed
    yBall = yBall - ySpeed; //increase the y position of the ball by y speed
  }

  //Check if ball completely exits left side of the screen 
  if (xBall + radius < 0) //if the ball exits the left side of the screen 
  {
    rightScore = rightScore + 1; //increment the right player's score by one
    xBall = screenWidth/2; //set the horizontal position of the ball to half of the width
    yBall = screenHeight/2; //set the vertical position of the ball to half of the height
    gameOn = false;
  } 
  
  //Check if ball completely exits right side of the screen 
  if (xBall - radius > screenWidth) //if the ball exits the right side of the screen 
  {
    leftScore = leftScore + 1; //increment the right player's score by one
    xBall = screenWidth/2; //set the horizontal position of the ball to half of the width
    yBall = screenHeight/2; //set the vertical position of the ball to half of the height 
    gameOn = false;
  }
  
  //Check if ball hits top and bottom sides of the screen 
  if (yBall - radius < 0 || yBall + radius > screenHeight) //if the ball hits the top or bottom sides of the screen 
  {
    ySpeed = ySpeed + - ySpeed + 1; //then reverse the polarity of the vertical speed so the ball moves in the opposite vertical direction
  }
}
int wierd = -99;
int rightPaddleY()
{
return int(wierd);
}
int rightPaddleX()
{
return int(wierd);
}
int leftPaddleY()
{
return int(wierd);
}
int leftScoreX()
{
return int(leftScoreX);
}
int scoreY()
{
return int(leftScoreY);
}
int leftScore()
{
return int(leftScore);
}
int ballY()
{
return int(wierd);
}
int ballX()
{
return int(wierd);
}
int paddleHeight()
{
return int(wierd);
}
int leftPaddleX()
{
return int(wierd);
}
int rightScore()
{
return int(rightScore);
}
int txtSize()
{
return int(tSize);
}
int paddleWidth()
{
return int(wierd);
}
int rightScoreX()
{
return int(rightScoreX);
}
int diameter()
{
return int(wierd);
}
boolean gameOn()
{
return gameOn;
}
void setrightPaddleY(int x)
{
wierd= x ;
}
void setrightPaddleX(int x)
{
wierd= x ;
}
void setleftPaddleY(int x)
{
wierd= x ;
}
void setleftScoreX(int x)
{
leftScoreX= x ;
}
void setscoreY(int x)
{
leftScoreY= x ;
}
void setleftScore(int x)
{
leftScore= x ;
}
void setballY(int x)
{
wierd= x ;
}
void setballX(int x)
{
wierd= x ;
}
void setpaddleHeight(int x)
{
wierd= x ;
}
void setleftPaddleX(int x)
{
wierd= x ;
}
void setrightScore(int x)
{
rightScore= x ;
}
void settxtSize(int x)
{
tSize= x ;
}
void setpaddleWidth(int x)
{
wierd= x ;
}
void setrightScoreX(int x)
{
rightScoreX= x ;
}
void setdiameter(int x)
{
wierd= x ;
}
void setgameOn(boolean x)
{
gameOn= x ;
}
}
