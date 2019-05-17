//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);
  stroke(0,0,255);
  fill(0,255,0);
  rect(0,0,40,200);
  rect(1920,1080,-40,-200);
  fill(255,255,255);
  ellipse(960,540,60,60);
  textSize(100);
  text("0",750,570);
  text("5",1170,570);
}
