//maxX = 1920, maxY =1080


float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(209);//sets the background<colour to light grey
  stroke(0,255,255);//sets the colour of the<outline of ah!pes<drawn below ths code light blue
  fill(128,0,0);//sets the colour of shapes drawn below this code dark red
  rect(0,0,100,300);//draws a rectangle
  rect(1820,780,100,300);//draws a rectangle
  fill(255);//sets the colour of the shape drawn below this code white
  ellipse(960,540,50,50);//draws an ellipse
  textSize(60);//sets text size to 60
  fill(0);//sets the colour of the text drawn below this code black
  text("4",860,540);//writes text on screen
  text("6",1060,540);//writes text on screen

}
