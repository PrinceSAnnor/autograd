//maxX = 2190, maxY = 1080

float screenWidth = 2190; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0); //sets the background black
  
 
 stroke(0, 255, 0);//sets the colour of the outline of shapes drawn below this code green
 fill(255, 0, 0);//Sets the colour of shapes drawn below this code
 rect(0, 0, 50, 250);//draws a rectangle 
 rect(2140, 830, 50, 250);//draws a rectangle
  
 fill(255, 120, 54);//Sets the colour of shapes drawn below this code
 ellipse(1095, 540, 50, 50);//draws an ellipse
 
 fill(255, 229, 0);//Sets the colour of shapes drawn below this code
 textSize(50);//set text size to 50
 text("15", 895, 540);//writes text on screen 
 text("20", 1295, 540);//writes text on screen
}
