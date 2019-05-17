//maxX = 1920, maxY = 1080
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
rect(0, 0, 100, 300);
rect(1820, 780, 100,300);
fill(255);
ellipse(960, 540, 50, 50);
textSize(100);
text("7", 1160, 540);
text("6",720,540);
}

