//maxX = 800, maxY = 442

float screenWidth = 800; //set to your maxX
float screenHeight = 442; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(255,0,255);  //sets the background purple
  
  fill(0,0,128); //color interior of rectangle blue

  stroke(255,0,0); //color exterior of rectangle red

  rect(0, 0, 50, 150); //draws a rectangle 
  
  fill(0,0,128); //color interior blue

  stroke(255,0,0); //color exterior red

  rect(750,300,50,150); //draws a rectangle
  
  fill(0,128,0); //color green interior of ellipse

  stroke(255,0,0); //color exterior red

  ellipse(403, 221, 20, 20); //draws an ellipse


  textSize(40); //set text size to 40


  text("5", 325, 230); //writes text on screen
  
  
  text("2", 481, 230); //writes text on screen
}
