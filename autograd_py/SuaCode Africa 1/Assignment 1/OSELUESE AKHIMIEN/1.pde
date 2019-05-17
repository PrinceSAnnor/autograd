//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,0,64);//sets the background dark blue
  
  stroke(0,255,255);//sets the color of the outline of shapes drawn below this code light blue
  
  fill(0,255,255);//sets the color of shapes drawn below this code light blue
  
  rect(20,20,80,300);//draws a rectangle
  
  rect(2060,760,80,300);//draws a rectangle
  
  stroke(0,255,255);//sets the color of the outline of shapes drawn below this code light blue
  
  fill(128,0,0);//sets the color of shapes drawn below this code red
  
  ellipse(1080,540,60,60);//draws an ellipse
  
  textSize(80);//set text size to 40
  
  fill(128,128,128);//sets the color of text drawn below this code gray
  
  text("2",680,540);//writes text on screen
  
  text("5",1480,540);//writes text on screen
}
