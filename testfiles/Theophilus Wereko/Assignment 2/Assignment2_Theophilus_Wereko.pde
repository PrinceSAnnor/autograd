// Declare and initialise some variables 
int leftPadX=0;  //declare and initialise a variable leftpadX to hold the x cordinate of the left paddle
int leftPadY=0; //declare and initialise a variable leftpadY to hold the y cordinate of the left paddle
int padWidth;   // declare a variable padWidth to hold the value of the width of both Paddles
int padHeight;  // declare a variable padHeight to hold the value of the height of both paddles 
int rightPadX;   // declare a variable rightpadX to hold the x cordinate of the right Paddle
int rightPadY;   // declare a variabl rightpadY to hold the y cordinate of the right paddle
int ballX;       // declare a variable to hold the x cordinate of the ball
int ballY;       // declare a variable to hold the y cordinate of the ball
int ballDia;     // declare a varible to hold the value of the diameter and radius of the ball
int textFont = 30; // declare and initialise a variable textfont to hold the value of textZise on the screen
int leftPlayScore = 0; // declare and initialise a variable to hold the initial score of left player 
int rightPlayScore= 0; // declare and initialise a variable to hold the initial score of the right player 
int scoreY;            // declare a variable scoreY to hold the position of the y cordinate of the score counter for both players 
int leftScoreX;        // declare a variable to hold the x cordinate of the score counter for left player
int rightScoreX;       // declare a variable to hold the x cordinate of score counter for right player
int ballSpeedX=3;      // declare and initialise a variable to hold the value of the ball's speed in x cordinate 
int ballSpeedY=0;      //declare and initialise a variable to hold the value of the ball's speed in y cordinate

void setup() //runs once
{
    fullScreen(); //sets fullScreen
    
    stroke(0,255,255);// set shape outline color to cyan
   
   //initialise variables that uses system width and height 
    padWidth= width/40; //initialize width of the Paddle
    padHeight=height/4; //initialize height of the Paddle
    rightPadX=width;    //initialize the x cordinate of the right Paddle
    rightPadY= height;  //initialize the y cordinate of the right paddle
    ballX=width/2;      //initialise the x cordiante of the ball
    ballY=height/2;     //initialise the y cordinate of the ball
    ballDia=width/48;   //initialise the Diameter of the ball
    scoreY= height/2;   // initialise the y cordinate of the score counter position for both players
    rightScoreX = (width/2) + 200; //initialise the x cordinate for the score counter position for the right player
    leftScoreX = (width/2) - 200;  //initialise the x cordinate for the score counter position for the left player
}

void draw() //runs forever
{
   background(0); //set black as the backgroung color
 
  // draw paddles as rectangle
  fill(0,255,0);  // fill the rectangular paddles with color green
  rect(leftPadX,leftPadY,padWidth,padHeight); // draw paddle for left player 
  rect(rightPadX,rightPadY,- padWidth,- padHeight); //draw paddle for right player 
  
  // Draw the ball
  fill(255); // fill the ball with white color 
  stroke(0); // change stroke to black to get clean move. 
  ellipse(ballX,ballY, ballDia,ballDia); // draw the ball at the center of the screen
 
 // score counter text for players 
 textSize(textFont); // set the score counter text size to 30
 text(leftPlayScore,leftScoreX,scoreY); // position '0' on the left side  of the screen representing the score of the left side player 
 text(rightPlayScore,rightScoreX,scoreY); // position  '0' on the right side of the ball representing score of right side player 
  
  // move ball
 ballX+=ballSpeedX; // move ball to the right or left the screen
 ballY-=ballSpeedY; // move ball to up or down the screen
}

// Reflection Essay
/* Woow...Finaly, I am through with
this challenging task. the concept 
was clear and I understood it from 
the beginning but i got stack when 
I started declaring my variables. 
least did I know that I cannot declare
and Initialise a variable that uses 
width and height before the setUp 
function and that is my mess. Since 
I am using phone error reading and 
debugging is kind of difficult for me
but it was all exciting when I finaly 
figured it out. I think next time the 
note should be clear about such a key 
point. All the same sorry for late 
submission. I will do better next time.*/
