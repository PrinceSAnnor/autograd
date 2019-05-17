//maxX = 800, maxY = 480

float screenWidth = 800; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0,0,0); //set the background grey 
 
 stroke(250); //set the outline colour 
 
 rect(00, 00, 50, 250); //draws a rectangle 
 
 fill(0,0,128); //set colour to dark blue 
 
 ellipse(300, 200,50,50); //draws an ellipse 
 
 textSize(40); //set the size to 40
 
 text("0 ",500,200); //writes text on the screen 
 
 fill(0,0,167); //set the colour of text 
 
 text("3 ", 150, 200); //writes text on screen 
 
 fill(168); //set the colour of text 
 
 rect(736,250,60, 225); // draws a rectangle 
 }
