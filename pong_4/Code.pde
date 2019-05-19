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
float xSpeed = 6; //horizontal speed of the ball
float ySpeed = 6; //vertical speed of the ball
float radius = 25; //radius of the ball
int tSize = 30;
boolean gameOn = false;

void once()
{
  fullScreen(); //Sets the program to run in full screen mode
}


void forever()
{
  background (0); //set background to black each frame
  stroke (0, 0, 255); //use a blue outline for all shapes until stroke is run again with another color

  setGameMode(); //checks if should set game on
  displayScores(); //displays the scores for the game
  displayBall(); //displays the ball
  displayPaddles(); //display paddles

  moveBall(); //moves the ball
  movePaddles(); //moves paddles and keeps it in the screen

  checkWall(); //makes ball bounce off top and bottom walls, and changes players’ scores when it hits right and left walls
  checkLeftPaddle(); //checks for intersection between ball and left paddle 
  checkRightPaddle(); //checks for intersection between ball and right paddle
}

//Checks if should set game on
void setGameMode() {
  //Set game to be on when screen is touched
  if (mousePressed) {
    gameOn = true;
  }
}
//Draws the scores 
void displayScores() //displays interface
{
  textSize(30); //set size of the player's scores
  fill (255); //set color to white
  text (leftScore, leftScoreX, leftScoreY); //draw left player's score 
  text (rightScore, rightScoreX, rightScoreY); //draw right player's score
}

//Draw Paddles
void displayPaddles() {
  fill (0, 255, 0); //fill all shapes to green until fill is run with another color 
  rect (leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //draw left paddle
  rect (rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //draw right paddle
}

//Draws ball on screen
void displayBall() 
{
  fill(255); //set ball color to white  
  ellipse (xBall, yBall, diameter, diameter); //draw ball unto the screen
}

//Moves ball if game is on
void moveBall() 
{
  //Checks if game is on
  if (gameOn) {
    xBall = xBall + xSpeed; //increase the x position of the ball by x speed
    yBall = yBall + ySpeed; //increase the y position of the ball by y speed
  }
}

//Checks if ball hits any of the 4 walls and either bounces or exits
void checkWall()
{
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
    ySpeed = ySpeed * -1; //then reverse the polarity of the vertical speed so the ball moves in the opposite vertical direction
  }
}

//Checks if ball has hit left paddle
void checkLeftPaddle()
{
  //Check if there is an overlap between ball and left paddle 
  boolean hasOverlappedLeftPaddle = doesOverlap(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, xBall, yBall, radius); 

  if (hasOverlappedLeftPaddle)
  {
    xSpeed = xSpeed * -1; //reverse the ball's horizontal speed
  }
}

//Checks if ball has hit right paddle
void checkRightPaddle()
{
  //Check if there is an overlap between ball and right paddle
  boolean hasOverlappedRightPaddle = doesOverlap(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, xBall, yBall, radius); 

  if (hasOverlappedRightPaddle)
  {
    xSpeed = xSpeed * -1; //reverse the ball's horizontal speed
  }
}

//Moves left paddle and keeps it on the screen 
void movePaddles() 
{  
  //Check if touching left part of screen
  if (mouseX < screenWidth/2)
  {
    leftPaddleY = constrain(mouseY, 0, screenHeight-paddleHeight); //constrain paddle to drawing window
  }

  //Check if touching right part of screen
  if (mouseX > screenWidth/2)
  {
    rightPaddleY = constrain(mouseY, 0, screenHeight-paddleHeight); //constrain paddle to drawing window
  }
}

//Checks if ball overlaps paddle

boolean doesOverlap(float xPaddle, float yPaddle, float widthPaddle, float heightPaddle, float xBall, float yBall, float radius) {

  float ballLeftEdge = xBall-radius; //left edge of ball
  float ballBottomEdge = yBall+radius; //bottom edge of ball
  float ballRightEdge = xBall+radius; //right edge of ball
  float ballTopEdge = yBall-radius; //top edge of ball

  float paddleLeftEdge = xPaddle; //left edge of paddle
  float paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
  float paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
  float paddleTopEdge = yPaddle; //top edge of paddle

  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
  {   
    return true;
  } else { 
    return false;
  }
}

int rightPaddleY()
{
return int(rightPaddleY);
}
int rightPaddleX()
{
return int(rightPaddleX);
}
int leftPaddleY()
{
return int(leftPaddleY);
}
int leftScoreX()
{
return int(leftScoreX);
}
int scoreY()
{
return int(leftScoreY);
}
int ballY()
{
return int(yBall);
}
int leftScore()
{
return int(leftScore);
}
int ballX()
{
return int(xBall);
}
int paddleHeight()
{
return int(paddleHeight);
}
int leftPaddleX()
{
return int(leftPaddleX);
}
int rightScore()
{
return int(rightScore);
}
int txtSize()
{
return int(tSize);
}
int diameter()
{
return int(diameter);
}
int paddleWidth()
{
return int(paddleWidth);
}
int rightScoreX()
{
return int(rightScoreX);
}
int gameOn()
{
return int(gameOn);
}
}
