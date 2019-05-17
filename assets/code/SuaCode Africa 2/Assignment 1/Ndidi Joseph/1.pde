//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background  (0);
  fill (0,255,0);
  
  rect (0,0,50,200);// draws rectangle
  
  rect (2510,1240,2560,1440);//draws rectangle
  
  
  fill (255);
  
  ellipse (1280,720,100,100);//draws a ball circle shaped
  
  
  fill (255);
  
  textSize (100);
  
  text (0,1000,720);//write number 0
  
  text (5,1560,720);//write number 5
  
}
