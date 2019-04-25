//Declares variables for ball diameter, position, paddle size and position, score size and position
int ballX; 
    int ballY;
    int diameter;
    int radius;
    int leftPaddleX;
    int leftPaddleY;
    int rightPaddleX;
    int rightPaddleY;
    int paddleWidth;
    int paddleHeight;
    int leftScoreX,leftScoreY;
    int rightScoreX,rightScoreY;
    int textSize;

void setup() //runs once
{
    fullScreen(); //sets full screen
    background (0,0,0); //makes background black
    stroke (0,0,255); // blues the outline of shapes
    ballX =width/2; //stores x position of ball
    ballY= height/2; //stores Y position of ball
    diameter=50; //stores the diameter of the ball
    radius = diameter/2; // stores the radius
    leftPaddleX=0;//Stores x position of left paddle
    leftPaddleY=0;// stores initial y position of left paddle
    rightPaddleX=width-width/23;
    rightPaddleY=height-height/4;
    paddleWidth=width/23;
    paddleHeight=height/4;
    leftScoreX=width/2-width/6;
    leftScoreY=height/2;
    rightScoreX=width/2+width/6;
    rightScoreY=height/2;
    textSize=width/22;
} 

void draw() //runs forever
{
  //Code for the two paddles 
  
  fill(0,255,0); // makes the interior of paddles green it color
  
  rect(leftPaddleX,leftPaddleY, paddleWidth, paddleHeight); // draws a rectangular paddle on the left side
  
  rect(rightPaddleX,rightPaddleY ,paddleWidth, paddleHeight ); // draws a rectangular paddle on the left side
  
  
  
  //Code for the ball
  
  fill(255); // makes the interior of the ball  white it color
  
  ellipse(ballX,ballY, radius ,radius);//draws the ball in the middle
  
  
  
  //Code for the scores
  
  textSize(textSize); //sets text size 
  
  text ("4", leftScoreX, leftScoreY); //writes score for left player
  
  text ("3",rightScoreX,rightScoreY ); //writes score for right player
  
  //Move ball up and right
 ballX = ballX+1;  //increment x position
 ballY = ballY-1;  //decrement y position
}