//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  background(0);
 
}

void draw() //runs forever
{
  rect(0,0,20,60);
  rect(1420,660,20,60);
  fill(0,255,255);
  ellipse( 720,360,20,20);
  fill(255,0,255);
  stroke(255,255,0);
  text(" 4", 645,360);
  text(" 2", 770,360);
  size(20);// set text size to 20
  fill(255,0,0);
}


