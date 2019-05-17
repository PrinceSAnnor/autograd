//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (0);
  
  //drawing the paddles 
  stroke (0,0,255);
  fill(0,255,0);
  rect(0,0,90,400); //top left end paddle
  rect(1830,680,90,400); //bottom right end paddle
  
  //drawing the ball
  fill(255,255,255);
  ellipse (960,540,75,75); //ball at centre 
  
  //adding text
  textSize(40);
  text("7" ,840,550); 
  text("3", 1080, 550);
}
