//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}
void draw() //runs forever
{
  background (0,0,128);//sets background color to blue
  stroke(255,255,0);//sets the outline color of the paddles to yellow
  fill(0,255,255);//sets color of paddle to aqua
  rect(0,0,200,300);//sets the position,width and height of left top paddle
  rect(1960,780,200,300);//sets position,width and height of bottom right paddle
  fill(255,0,255);//sets color of ellipse to pink
  stroke(255,255,0);
  ellipse(1080,540,50,50);//sets the position of the ellipse
  textSize(40);//sets the size of the text to 40
  fill(255,255,255);//sets the color of text to white
  text("5",900,550);//sets position of first number on the left of the ellipse
  text("7",1230,550);//sets position of second number on the right of the ellipse
  
  
}
