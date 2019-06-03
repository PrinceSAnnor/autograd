class Code {


//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX

float screenHeight = 1080; //set to your maxY

int rect1X = 0; // Declare variable to hold x position for rectangle 1 

int rect1Y = 0; // Declare variable to hold y position for rectangle 1

int rect2X = 1860; // Declare variable to hold x position for rectangle 2

int rect2Y = 880; // Declare variable to hold y position for rectangle 2

int rectWidth = 60; // Sets the rectangle width

int rectHeight = 200; // Sets the rectangle height 

int ballX = 960; // Declare variable to hold x position of ball

int ballY = 540; // Declare variable to hold y position of ball

int ballWidth = 50; // Sets the ball width

int ballHeight = 50; // Sets the ball Height

int textSizes = 50; // Sets text size

int text1X = 760; // Declare variable to hold x postion for left player score

int textY = 540; // Declare variable to hold y position for both player's score

int text2X = 1160; //Declare variable to hold x position for right player score

int text1Score= 0; // Writes the left player score

int text2Score= 0; // Writes the right player score

int xSpeed = 5; // Sets the ball speed in the x position

int ySpeed = 5; // Sets the ball speed in the y postion

int radius = 25; // Sets half the width or height of the ball

boolean gameOn= false; //new variable to start ball's movement

void once()

{

  //  fullScreen(); //Sets the program to run in full screen mode
}

void forever()





{

  background(0);// sets the background to black

  stroke(0, 128, 0); // sets the outline colour of the shape below to green

  fill(0, 0, 128); // sets the colour of the shape below to indigo

  rect(rect1X, rect1Y, rectWidth, rectHeight); // draws the left side rectangle

  rect(rect2X, rect2Y, rectWidth, rectHeight); //draws the right side rectangle

  fill(255, 255, 0); // sets the colour of the shape below to yellow

  ellipse(ballX, ballY, ballWidth, ballHeight); // draws the ellipse

  textSize(textSizes); //set text size to 50

  text(text1Score, text1X, textY); // writes 15 on the screen

  text(text2Score, text2X, textY); // writes 40 on the screen

  //Check if mouse is pressed, set gameOn to true

  if (mousePressed) {
    gameOn = true;
  }

  if (gameOn) {

    //Move ball up and right

    ballX = ballX + xSpeed;

    ballY = ballY - ySpeed;
  }

  // Check if the ball hits left or right walls

  if (ballX-radius<0) {
    xSpeed=xSpeed - 1;
    text2Score=text2Score + 1;// increases score by of right player 1


    //return ball to centre
    ballX= 960;
    ballY= 540;
    gameOn=false;
  }
  if (ballX+radius> screenWidth) { 
    xSpeed=xSpeed - 1;

    text1Score=text1Score + 1;// increases score of right player

    //return ball to centre
    ballX= 960;
    ballY= 540;
    gameOn=false;
  }
  // Check if the ball hits top or bottom walls

  if ((ballY-radius<0) || (ballY+radius)> screenHeight) { 
    ySpeed= ySpeed * -1;// Reverse direction
  }
}
int rightPaddleY()
{
return int(rect2Y);
}
int rightPaddleX()
{
return int(rect2X);
}
int leftPaddleY()
{
return int(rect1Y);
}
int leftScoreX()
{
return int(text1X);
}
int scoreY()
{
return int(textY);
}
int ballY()
{
return int(ballY);
}
int leftScore()
{
return int(text1Score);
}
int ballX()
{
return int(ballX);
}
int paddleHeight()
{
return int(rectHeight);
}
int leftPaddleX()
{
return int(rect1X);
}
int rightScore()
{
return int(text2Score);
}
int txtSize()
{
return int(textSizes);
}
int diameter()
{
return int(ballWidth);
}
int paddleWidth()
{
return int(rectWidth);
}
int rightScoreX()
{
return int(text2X);
}
int gameOn()
{
return int(gameOn=);
}
}
