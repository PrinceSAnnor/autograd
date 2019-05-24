class Code {
//maxX = 1280, maxY = 720


float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

int ballX = 640; // Declares the variable to hold the x position of the ball
int ballY = 360; // Declares the variable to hold the y position of the ball
int ballWidth = 75; // Declares the variable to hold the width position of the ball
int ballHeight = 75; // Declares the variable to hold the height position of the ball

int leftPaddleX = 0; // Declares the variable to hold the x position of the left paddle
int leftPaddleY = 0; // Declares the variable to hold the y position of the left paddle

int rightPaddleX = 1200; // Declares the variable to hold the x position of the paddle on the right
int rightPaddleY = 370; // Declares the variable to hold the y position of the paddle on the right
 
int paddleWidth = 80; // Declares the variable to hold the width position of the paddle
int paddleHeight = 350; // Declares the variable to hold the height position of the paddle

int leftPlayerX = 480; // Declares the variable to hold the x position of the text located on the left
int leftPlayerY = 360; // Declares the variable to hold the y position of the text located on the left

int rightPlayerX = 800; // Declares the variable to hold the x position of the text located on the right
int rightPlayerY = 360; // Declares the variable to hold the y position of the text located on the right
 
int fontSize = 70; // Declares the variable to hold the text size to 70

void once()
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void forever()
{
  background(255,0,255); // Sets background colour to black
  
  stroke(0); // Sets outline of shapes to black
  
  fill(0,0,255); // Sets colour inside shapes to blue
  
  rect(leftPaddleX,leftPaddleY,paddleWidth,paddleHeight); // Establishes the position and size of the rectangle
  
  rect(rightPaddleX,rightPaddleY,paddleWidth,paddleHeight); //Establishes the position and size of the second rectangle



  stroke(0); // Sets outline of shapes to black

  fill(255); // Sets interior colour to white
 
  ellipse(ballX,ballY,ballWidth,ballHeight); // Plots the ball on the graph

  
  
  fill(255); // Sets text colour for upcoming code to to white
  
  text("0",leftPlayerX,leftPlayerY); // Positions first text on graph 
  
  textSize(70); // Sets text size to 70
  
  text("3",rightPlayerX,rightPlayerY); // Positions second text on graph

  textSize(70); // Sets text size to 70
   
    // Move ball down and right at a moderate speed
    ballX = ballX + 5;
    ballY = ballY + 3; 
    
} 
}
