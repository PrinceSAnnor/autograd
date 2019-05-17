//maxX = 1920, maxyY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0);//sets the background black
 
 stroke(0, 255,0);//sets the color of the outline of shapes drawn below this code green
 fill(0, 0, 255);//sets the color of the shapes drawn below this code
 rect(0, 0, 50, 250);//draws a rectangle
 rect(1670, 830, 50, 250);//draws a rectangle
 
 fill(255, 0, 255);//sets the color
 ellipse(960, 540, 50, 50);//draws an ellipse
 
 textSize(50);//set text size to 50
 text("10",760,540);//writes text on screen
 text("30",1060,540);//writes text on screen
 }
 