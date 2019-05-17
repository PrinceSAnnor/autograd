//maxX = 2220, maxY = 1080

float screenWidth = 2220; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
}

void draw() //runs forever
{
  background(0); //background colour
  
  //Paddles 
  stroke(130,0,0);
  fill(130,0,0);
  rect(0,0,90,400); //left paddle
  rect(2130,680,90,400); //right paddle
 
  //Ball 
  stroke(0,0,255);
  fill(0,0,255);
  fill(0,0,255);
  ellipse(1110,540,100,100); //ball
  
  //Scores
  textSize(110);
  text("4",795,540);
  text("6",1360,540); 
}
