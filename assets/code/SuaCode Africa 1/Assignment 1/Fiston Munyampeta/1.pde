//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  //setting the background color of the screen
  background(0);
  
  //creating paddles
  stroke(0,0,255);//paddles outline color
  fill(0,255,0);//paddles background color
  rect(0,0,40,200);//left paddle
  rect(1920,1080,-40,-200);//right paddle
  
  //Creating the ball in the center 
  fill(255,255,255);//ball background color
  ellipse(960,540,60,60);//center ball
  
  
  //creating arbitary text
  textSize(100);//setting text size same size on both text
  
  text("0",750,570);
  text("5",1170,570);
}
