//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
background(0);
fill(255, 0, 0);
rect(2, 2, 80, 150);
fill(255, 0, 0);
rect(1198, 568, 80, 150);
fill(255);
stroke(0, 255, 0);
ellipse(640, 360, 40, 40);
textSize(50);
text("0", 510, 360);
textSize(50);
text("5", 730, 360);
}