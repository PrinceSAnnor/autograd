// Declare and initialise some variables 
int leftpadX=0;  //declare and initialise a variable leftpadX to hold the x cordinate of the left paddle
int leftpadY=0; //declare and initialise a variable leftpadY to hold the y cordinate of the left paddle
int padWidth;   // declare a variable padWidth to hold the value of the width of both Paddles
int padHeight;  // declare a variable padHeight to hold the value of the height of both paddles 
int rightpadX;   // declare a variable rightpadX to hold the x cordinate of the right Paddle
int rightpadY;   // declare a variabl rightpadY to hold the y cordinate of the right paddle
int ballX;       // declare a variable to hold the x cordinate of the ball
int ballY;       // declare a variable to hold the y cordinate of the ball
int ballDia;     // declare a varible to hold the value of the diameter and radius of the ball
int textFont = 30; // declare and initialise a variable textfont to hold the value of textZise on the screen
int leftplayScore = 0; // declare and initialise a variable to hold the initial score of left player 
int rightplayScore= 0; // declare and initialise a variable to hold the initial score of the right player 
int scoreY;            // declare a variable scoreY to hold the position of the y cordinate of the score counter for both players 
int leftscoreX;        // declare a variable to hold the x cordinate of the score counter for left player
int rightscoreX;       // declare a variable to hold the x cordinate of score counter for right player
int ballspeedX=1;      // declare and initialise a variable to hold the value of the ball's speed in x cordinate 
int ballspeedY=0;      //declare and initialise a variable to hold the value of the ball's speed in y cordinate

void setup() //runs once
{
    fullScreen(); //sets fullScreen
    background(0); //set black as the backgroung color
    stroke(0,255,255);// set shape outline color to cyan
   
   //initialise variables that uses system width and height 
    padWidth= width/40; //initialize width of the Paddle
    padHeight=height/4; //initialize height of the Paddle
    rightpadX=width;    //initialize the x cordinate of the right Paddle
    rightpadY= height;  //initialize the y cordinate of the right paddle
    ballX=width/2;      //initialise the x cordiante of the ball
    ballY=height/2;     //initialise the y cordinate of the ball
    ballDia=width/48;   //initialise the Diameter of the ball
    scoreY= height/2;   // initialise the y cordinate of the score counter position for both players
    rightscoreX = (width/2) + 200; //initialise the x cordinate for the score counter position for the right player
    leftscoreX = (width/2) - 200;  //initialise the x cordinate for the score counter position for the left player
}

void draw() //runs forever
{
  // draw paddles as rectangle
  fill(0,255,0);  // fill the rectangular paddles with color green
  rect(leftpadX,leftpadY,padWidth,padHeight); // draw paddle for left player 
  rect(rightpadX,rightpadY,- padWidth,- padHeight); //draw paddle for right player 
  
  // Draw the ball
  fill(255); // fill the ball with white color 
  stroke(0); // change stroke to black to get clean move. 
  ellipse(ballX,ballY, ballDia,ballDia); // draw the ball at the center of the screen
 
 // score counter text for players 
 textSize(textFont); // set the score counter text size to 30
 text(leftplayScore,leftscoreX,scoreY); // position '0' on the left side  of the screen representing the score of the left side player 
 text(rightplayScore,rightscoreX,scoreY); // position  '0' on the right side of the ball representing score of right side player 
  
  // move ball
 ballX+=ballspeedX; // move ball to the right or left the screen
 ballY-=ballspeedY; // move ball to up or down the screen
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

/*

Without the background function in the draw function, the ball wipes the black
background as it moves and you don't want that.
To make sure the ball does not wipe the background, you have to put the background
function in the draw function so that it runs forever. Note that the setup function 
runs only once

1.fullscreen
2.landscape
3.shapes are the same on all devices
4.variables used for x and y speed
5.variables used for x and y positions, diameter
6.variables used for left paddle x and y positions
7.variables used for right paddle x and y positions
8.variables used for paddle with and height 
9.variables used for left player score, x and y positions
10.variables used for right player score, x and y positions
11.variables used for text size
12.variable names are descriptive
13.variable names use the camel case naming style                       -xxx
14.there are no magic numbers
15.ball moves at a certain speed and direction without leaving a trail  -xxx
16.code organized with setup and draw
17.code well commented
18.code indented properly
19.code looks clean

*/
