class Code {
//maxX = 1480, maxY = 720

int screenWidth = 1480; //set to your maxX

int screenHeight = 720; //set to yoir maxY

int screenWidthHalfed = 740; //maxX/2 = 1480/2 = 740

//x position of the ball is exactly half of the x axis
int ballX = 740; // maxX/2 = 1480/2 = 740

//y position of the ball is exactly half of the y axis
int ballY = 360; // maxY/2 = 720/2 = 360

int ballWidth = 50; //Declare variable to hold width of ball

int ballHeight = 50; //Declare variable to hold height of ball

int leftPaddleX = 0; //Declare variable to hold x position of left paddle

int leftPaddleY = 0; //Declare variable to hold y position of left paddle

int rightPaddleX = 1430; //Declare variable to hold x position of right paddle

int rightPaddleY = 540; //Declare variable to hold y position of right paddle

int paddleWidth = 50; //Declare variable to hold width of both right and left paddles

int paddleHeight = 180; //Declare variable to hold height of both right and left paddles

int leftPlayerScoreNumber = 0; //Declare variable to hold left player score's number

float leftPlayerScoreX = 493.3; //Declare variable to hold x position of left player score

int leftPlayerScoreY = 360; //Declare variable to hold y position of left player score

int rightPlayerScoreNumber = 0; //Declare variable to hold right player score's number

int rightPlayerScoreX = 987; //Declare variable to hold x position of right player score

int rightPlayerScoreY = 360; //Declare variable to hold y position of right player score

int wordSize = 100; //Declare variable to hold size of text

int xSpeed = 2; //ball's horizontal speed

int ySpeed = 5; //ball's vertical speed

int radius = 25; //since half of the width or height of the ball is the radius

boolean hasOverLappedLeftPaddle = false;

boolean hasOverLappedRightPaddle = false;

boolean beginGame = false; //New variable to start ball movement




void once()
{
  //  fullScreen(); //Sets the program to run in full screen mode
}




void forever()
{
  background(128, 0, 0); //sets the background red

  movePaddles(); //move paddles vertically
 
  displayScores(); //draws the scores on the screen
  
  displayBall(); //draws ball on the screen
  
  displayPaddles(); // draws the paddles on the screen
  
  moveBall(); //moves ball if game is on
  
  checkWall(); //makes the ball bounce off too and bottom walls, and increases left player's score if ball hits right wall and increase right player's score if ball hits left wall. sets game off if hits left or right wall
  
  setGameMode(); //sets game on if mouse is pressed
  
  stroke(0, 0, 255); //sets the color of the outline of the shapes drawn below this code blue
  
  textSize(wordSize); //sets text size to 100
  
  fill(255, 255, 0); //sets color of text drawn below this code yellow
  
  
  
  
  
  //Check if there is an overlap between ball and left paddle
  hasOverLappedLeftPaddle = checkLeftPaddle(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius);
  
  if(hasOverLappedLeftPaddle){
    xSpeed = xSpeed*-1;
  }
  
  //Check if there is an overlap between ball and right paddle
  hasOverLappedRightPaddle = checkRightPaddle(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, ballX, ballY, radius);
  
  if(hasOverLappedRightPaddle){
    xSpeed = xSpeed*-1;
  }
  }
  

void movePaddles() {
  
  if (mouseX < screenWidthHalfed){
  leftPaddleY = constrain(mouseY,  0, screenHeight - paddleHeight); //constrain left paddle window to drawing window
  }else{
  rightPaddleY = constrain (mouseY, 0, screenHeight - paddleHeight); //constrain right paddle window to drawing window
  }
  }
  
  
  
  //Checks if ball overlaps left paddle

boolean checkLeftPaddle(int leftPaddleX, int leftPaddleY, int paddleWidth, int paddleHeight, int ballX, int ballY, int radius) {

  float ballLeftEdge = ballX - radius; //left edge of ball

  float ballBottomEdge = ballY + radius; //bottom edge of ball

  float ballRightEdge = ballX+radius; //right edge of ball

  float ballTopEdge = ballY-radius; //top edge of ball


  float leftPaddleLeftEdge = leftPaddleX; //left edge of left paddle

  float leftPaddleBottomEdge = leftPaddleY+paddleHeight; //bottom edge of left paddle

  float leftPaddleRightEdge = leftPaddleX+paddleWidth; //right edge of left paddle

  float leftPaddleTopEdge = leftPaddleY; //top edge of left paddle

  if (ballBottomEdge >= leftPaddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap

    && ballTopEdge <= leftPaddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap

    && ballLeftEdge <= leftPaddleRightEdge //Check if left edge of ball and right edge of paddle overlap

    && ballRightEdge >= leftPaddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap

  {  
    return true;
  }
else {
    return false;
  }
}

//Checks if ball overlaps right paddle

boolean checkRightPaddle(int rightPaddleX, int rightPaddleY, int paddleWidth, int paddleHeight, int ballX, int ballY, int radius) {

  float ballLeftEdge = ballX - radius; //left edge of ball

  float ballBottomEdge = ballY + radius; //bottom edge of ball

  float ballRightEdge = ballX+radius; //right edge of ball

  float ballTopEdge = ballY-radius; //top edge of ball


  float rightPaddleLeftEdge = rightPaddleX; //left edge of left paddle

  float rightPaddleBottomEdge = rightPaddleY+paddleHeight; //bottom edge of left paddle

  float rightPaddleRightEdge = rightPaddleX+paddleWidth; //right edge of left paddle

  float rightPaddleTopEdge = rightPaddleY; //top edge of left paddle

  if (ballBottomEdge >= rightPaddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap

    && ballTopEdge <= rightPaddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap

    && ballLeftEdge <= rightPaddleRightEdge //Check if left edge of ball and right edge of paddle overlap

    && ballRightEdge >= rightPaddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap

  {  
    return true;
  }
else {
    return false;
  }
}




void displayScores() {
  
  text(leftPlayerScoreNumber, leftPlayerScoreX, leftPlayerScoreY); //writes text on screen
 
  text(rightPlayerScoreNumber, rightPlayerScoreX, rightPlayerScoreY); //writes text on screen
}



void displayBall() {
  
  fill(255); //sets the color of shapes drawn below this code white
  
  ellipse(ballX, ballY, ballWidth, ballHeight); //draws an ellipse
  
}


void displayPaddles() {
  fill(0, 128, 0); //sets the color of shapes drawn below this code deep green
  
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //draws a rectangle
  
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //draws a rectangle
  
}



void moveBall() {
  //Move ball
  if (beginGame){
  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  }else{
  ballX = 740;
  ballY = 360;
  }
}



void checkWall() {
  //Check if ball hits top or bottom walls
  if ((ballY-radius < 0) || (ballY+radius) > screenHeight){
  ySpeed = ySpeed * -1; //Reverse direction
  }
  
  //Check if right player's score increases and the game is off
  if (ballX-radius < 0){
  rightPlayerScoreNumber = rightPlayerScoreNumber + 1;
  beginGame = false;
  }
  
  //Check if left player's score increases and game is off
  if (ballX+radius > screenWidth){
  leftPlayerScoreNumber = leftPlayerScoreNumber + 1;
  beginGame = false;
  }
  
  if ((ballX-radius < 0) || (ballX+radius) > screenWidth){
  xSpeed = xSpeed * -1; //Reverse direction
  }
}



void setGameMode() {
   //Check if mouse is pressed, set beginGame to true
  if (mousePressed){
  beginGame = true;
  }
}
int wierd = -99;
int getMouseX(){
return int(mouseX);
}
void setMouseX(int x){
mouseX = x;
}
int getMouseY(){
return int(mouseY);
}
void setMouseY(int x){
mouseY = x;
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
return int(leftPlayerScoreX);
}
int scoreY()
{
return int(leftPlayerScoreY);
}
int leftScore()
{
return int(leftPlayerScoreNumber);
}
int ballY()
{
return int(ballY);
}
int ballX()
{
return int(ballX);
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
return int(rightPlayerScoreNumber);
}
int txtSize()
{
return int(wordSize);
}
int paddleWidth()
{
return int(paddleWidth);
}
int rightScoreX()
{
return int(rightPlayerScoreX);
}
int diameter()
{
return int(ballWidth);
}
int ballXSpeed()
{
return int(xSpeed);
}
int ballYSpeed()
{
return int(ySpeed);
}
void setrightPaddleY(int x)
{
rightPaddleY= x ;
}
void setrightPaddleX(int x)
{
rightPaddleX= x ;
}
void setleftPaddleY(int x)
{
leftPaddleY= x ;
}
void setleftScoreX(int x)
{
leftPlayerScoreX= x ;
}
void setscoreY(int x)
{
leftPlayerScoreY= x ;
}
void setleftScore(int x)
{
leftPlayerScoreNumber= x ;
}
void setballY(int x)
{
ballY= x ;
}
void setballX(int x)
{
ballX= x ;
}
void setpaddleHeight(int x)
{
paddleHeight= x ;
}
void setleftPaddleX(int x)
{
leftPaddleX= x ;
}
void setrightScore(int x)
{
rightPlayerScoreNumber= x ;
}
void settxtSize(int x)
{
wordSize= x ;
}
void setpaddleWidth(int x)
{
paddleWidth= x ;
}
void setrightScoreX(int x)
{
rightPlayerScoreX= x ;
}
void setdiameter(int x)
{
ballWidth= x ;
}
void setballXSpeed(int x)
{
xSpeed= x ;
}
void setballYSpeed(int x)
{
ySpeed= x ;
}
}
