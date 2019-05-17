//maxX = 1520, maxY = 720

float screenWidth = 1520; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0); //Sets the background black
  
  stroke(0, 0, 125); //sets outlines of shapes blue
  
  fill(0, 255, 0); // sets interior of shapes green
  
  rect(0, 0, 19, 180); // draws a rectangle
  
  rect(1501, 540, 95, 180); // draws a rectangle
  
  fill(255); // sets interior of ellipse white
  
  ellipse(855, 315, 95, 45); //draws an ellipse
  
  textSize(80); //set text size to 20
  
  text("2", 475, 315); //write text on screen
  
  text("1", 1235, 315); //write text on screen
}
