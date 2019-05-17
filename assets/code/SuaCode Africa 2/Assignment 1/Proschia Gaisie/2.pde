//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{


 fullScreen(); // sets the program to run in full screen mode 
  
}

void draw() //runs continuosly until the program is stopped

{
  background(0);//sets the background black
  
  stroke(255,255,0); // sets the color of the outline of shapes drawn below this code yellow
  fill(0,255,0); //sets the color of shapes drawn below this code light  green 
  rect(0,0,50,250); //draws a rectangle 
  stroke(255,255,0); // sets the color of the outline of shapes drawn below this code yellow
  fill(0,255,0); // sets the color of shapes drawn below this code light green 
  rect(2510,1140,50,250); // draws a rectangle 
  
  
  
  stroke(0,0,255); // sets the color of the outline of the shapes drawn below this code to light blue 
  fill(128,0,0); // sets the colour of the shapes drawn below this code white
  ellipse(1330,720,100,100); //draws an ellipse
  
  
  fill(255,255,255);// sets the color of the shapes drawn below this code white
  textSize(100); //sets text size to 100
  text("3",1000,720); // writes text on screen 
  text("6",1600,720); // writes text on screen
  
}
