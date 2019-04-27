class Code {
//maxX = ... 1920  .., maxY = 1080

int leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, rightPaddleX, rightPaddleY; //varaibles for paddles
int ballX, ballY, ballWidth, ballHeight; //variables for ball
int leftScore, leftScoreX, rightScore, rightScoreX, scoreY, txtSize; //variables for scores
int x = 0;
int ballSpeedX, ballSpeedY;

void once()
{
  //  size(1920, 1080); //sets the width and height of the program  
  leftPaddleX = 0;
  leftPaddleY = 0;
  rightPaddleX = 1872;
  rightPaddleY = 864;
  paddleWidth = 48;
  paddleHeight = 216;
  
  ballX = 960;
  ballY = 540;
  ballWidth = 50;
  ballHeight = 50;
  
  leftScore = 0;
  leftScoreX = 480;
  rightScore = 5;
  rightScoreX = 1440; 
  scoreY = 540;
  txtSize = 40;
  
  ballSpeedX = 2;
  ballSpeedY = 2;
}

void forever()
{
  background(0); //set background black
  
  fill(45, 6, 233); 
  ellipse(ballX, ballY, ballWidth, ballHeight); //draw circle at center
  
  //fill(255);
  fill(66, 227, 90);
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight); //left paddle at top left 
  
  //Draw paddles
  fill(66, 227, 90);

  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight); //right paddle at the bottom right

  //Draw scores on screen
  stroke (0, 25, 255); //use a blue outline for all shapes
  //  textSize(txtSize); //size of the text 
  text(leftScore, leftScoreX, scoreY);  //left score at the left corner of the screen
  text(rightScore, rightScoreX, scoreY); //right score at right corner of the screen
  
  ballX = ballX + ballSpeedX; //move ball in x direction
  ballY = ballY + ballSpeedY; //move ball in y direction
}
}
