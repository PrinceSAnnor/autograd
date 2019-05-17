//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
fullScreen(); //Sets the program to run in full screen mode
  
}
 
void draw() //Runs forever
  
{
  
background(0);//Sets the background black
 
stroke(0, 0, 255);//Sets the color of shapes drawn below this code below blue
 
fill(255, 0, 0);//Sets the color of shapes drawn below this code red
  
rect(2, 2, 25, 75);//draws rectangle
  
stroke(0, 0, 255);//Sets the colour of shapes drawn below this code below blue
  
fill(255, 0, 0);//Sets the colour of shapes drawn below this code red
  
rect(825, 402, 25, 75);//draws rectangle
  
fill(255, 255, 0);//Sets the color of shapes drawn below this code yellow
  
ellipse(454, 185, 20, 20);//draws a circle
  
textSize(20);//sets text size to 20
  
fill(255);//sets the colour of text drawn below this code white
  
text("7", 400, 195);//writes text on screen 

textSize(20);//sets text size to 20

fill(255);//sets the colour of text drawn below this code white

text("1", 500, 195);//writes text on screen

}
