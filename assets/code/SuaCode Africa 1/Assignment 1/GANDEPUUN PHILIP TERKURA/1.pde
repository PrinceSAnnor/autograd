//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //Sets the background to black 
  
  fill(0,255,0); //Sets the fill colour of rectangle below this code to green
  
  stroke(0,0,255); // set colour of the stroke to blue
  
  rect(0,0,60,120); //Draws a rectangle 
  
  fill(0,255,0); // set the fill colour of the rectangle below to green 
  
  stroke(0,0,255); // set colour of the stroke to blue
  
  rect(1380,600,60,120); //Draws a rectangle 
  
  fill(255); // set the colour of the fill colour of the circle to white
  
  stroke(0,0,255); // set colour of the stroke to blue
  
  ellipse(720,360,60,60); //draws a circle
  
  textSize(60); // set the size of text below this code to 60 
  
  fill(255); //set the color of the text  below to white
  
  stroke(0,0,255); // set colour of the stroke to blue
  
   text("0",525,360); // writes text on the screen 
   
   text("5",915,360); // writes text on the screen 
   
}
