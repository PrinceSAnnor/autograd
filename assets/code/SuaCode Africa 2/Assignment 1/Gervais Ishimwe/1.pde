//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); // The background of Pong game Interface  is black in color
  
  // codes for right paddle bar 
  
  stroke(0,0,255); // The outline of the left paddle bar is colorized blue
  fill(0,255,0); // The left paddle bar is colorized green
   rect(0,0,40,190); // Draws a rectangle as left paddle bar
  
  // codes for left score
  
  fill(255,255,255); // The text(score) will appear in white color
  text("0",440, 350); // The text(score) appears here 
  textSize(50);
  
  // codes for inner ball
  
  stroke(0,0,255); // The outline of the ball is colorised blue
  fill(255,255,255); // The inner ball is colorized white
  ellipse(620,340,30,30); // Draws the inner ball
  
  // codes for right score
  
  fill(255,255,255); // The text(score) will appear in white color
  text("5",800, 350); // The text(score) appears here 
  textSize(50);
  
  // codes for right paddle
  
  stroke(0,0,255); // The outline of the right paddle bar is colorized blue
  fill(0,255,0); // The right paddle bar is colorized black
  rect(1240,530,90,220); //Draws a right paddle bar
  
  
}