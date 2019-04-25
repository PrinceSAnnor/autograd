int leftPadX;// declare variable to hold x position of ball
int leftPadY;//declare variable to hold y position of ball
int leftPad=width/50;

float rightPadX;//declare variable to hold position
float rightPadY;//declare variable to hold position
float rightPad=height/6;

int ballX;//declare variable to hold X position of ball
float ballY;//declare variable to hold Y position of ball
float diameter=30;//"declare and initialize variable to hold size of ball"


void setup() //runs once
{
  fullScreen(); //sets full screen
  leftPadX=width/2;
  leftPadY=height/2;
  
  rightPadX=width/1.02;
  rightPadY=height/2;
  
  ballX = width/2;
  ballY = height/1.2;
 background(0);// set black as the background color
 fill(255,255,255);//set the interior of objects to gray
 textSize(30);//set the text to 30
 text("0",width/3,height/2);//writes text on the screen
 text("                 7", width/2, height/2);// writes text on the screen
 stroke (0,0,255);//set the outline of objects to be blue
 ellipse(ballX,ballY, diameter, diameter);// draws a circle
 
  fill(0,255,0);// set the interior of rectangle to green
 
  rect(0,30, width/64, height/4);// draws a rectangle
  

}

void draw() //runs forever
{
  rect(1400,500, width/64, height/4);// draws a rectangle
 
 rect(1400,500,width/64, height/4);// draws a rectangle
 rect(leftPadX,leftPadY,leftPad,rightPad);//draws a rectangle
  rect(rightPadX,rightPadY,leftPad,rightPad);//draws a rectangle
  
}





