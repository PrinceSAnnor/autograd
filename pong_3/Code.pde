class Code {
//maxX = 1440, maxY = 720

int screenWidth = 1440; //set to your maxX
int screenHeight = 720; //set to your maxY

//x position of the ball is exactly half of the x axis
int ballX = 720;  // maxX/2 = 720

//y position of the ball is exactly half of the y axis
int ballY = 360;  // maxY/2 = 360

int ballWidth = 80; //width of ball
int ballHeight = 80; //height of ball
int xSpeed = 5; //ball's horizontal speed
int ySpeed = 5; //ball's vertical speed
int radius = 40; //since half the width or the height of the ball is the radius

//paddle varibles
int leftPaddleX = 0; //Declare variables to hold x position of left rect
int leftPaddleY = 0;  // Declare variables to hold Y position of left rect
int leftPaddleW = 100; // Declare variables to hold W position of rect
int leftPaddleH = 300; // Declare variables to hold H position of rect
int rightPaddleX = 1340;
int rightPaddleY = 420;
int rightPaddleW = 100;
int rightPaddleH = 300;

//textvaribles

int textSize = 30; 
int leftScore = 0;
int rightScore = 0;
int leftScoreX = 500;
int leftScoreY = 360;
int rightScoreX = 1000;
int rightScoreY = 360;


boolean gameOn = false; //new variable to start ball's movement

void once()
{
  //  fullScreen(); //Sets the program to run in full screen mode
}

void forever()
{
  background(0); //set color to black

  stroke(0, 0, 255); // sets the color of the outline of the shape drawn below this code blue

  fill(0, 128, 0); //sets the color of shapes drawn below this code green

  rect(leftPaddleX, leftPaddleY, leftPaddleW, leftPaddleH); // draws first rectangle left

  rect(rightPaddleX, rightPaddleY, rightPaddleW, rightPaddleH); // draws second rectangle right

  fill(255, 255, 0); // sets the color of shapes drawn below this code yellow

  ellipse(ballX, ballY, ballWidth, ballHeight); // draws an ellipse

  textSize(30); //set text size to 30

  text(leftScore, leftScoreX, leftScoreY); //writes text on left middle part of the screen

  text(rightScore, rightScoreX, rightScoreY); //writes text on right middle part of the screen

  if (mousePressed) {

    gameOn = true;
  }

  if (gameOn == true) {
    //Move ball
    ballX = ballX+xSpeed;
    ballY = ballY+ySpeed;
  } else if (gameOn == false) {
    ballX = 720;
    ballY = 360;
  }

  //increament score if ball hits left wall
  if (ballX-radius < 0) {
    leftScore = leftScore + 1;
    gameOn=false;
  }

  //increament score if ball hits right wall
  if ((ballX+radius) > screenWidth) {
    rightScore = rightScore + 1;
    gameOn = false;
  }

  //Check if ball hits left or right walls
  if ((ballX-radius < 0) || (ballX+radius) > screenWidth) {
    xSpeed = xSpeed * -1;  //Reverse direction
    gameOn=false;
  }

  //Check if ball hits left or right walls
  if ((ballY-radius < 0) || (ballY+radius) > screenHeight) {
    ySpeed = ySpeed * -1;  //Reverse direction
  }
}


/* i will say this was one of my most challenging exercise
but its worth it. it took me 2hours to fugure things out.*/
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
return int(ballY);
}
int leftScore()
{
return int(leftScore);
}
int ballX()
{
return int(ballX);
}
int paddleHeight()
{
return int(leftPaddleH);
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
return int(30);
}
int diameter()
{
return int(ballWidth);
}
int paddleWidth()
{
return int(leftPaddleW);
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
