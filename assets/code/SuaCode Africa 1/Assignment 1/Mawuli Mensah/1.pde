//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  stroke(0);
    background (200);
    
  fill(0,255,255);
    rect(0,0,25,100);
  fill(0,255,255);
    rect(826,376,25,100);
    
  fill(255,0,255);
    ellipse(427,240,30,30);
  
  fill(0);
  text("2",325,240);
  text("6",525,240);
}
