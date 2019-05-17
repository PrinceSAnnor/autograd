//maxX = 1280, maxY = 720

float screenWidth = 1200; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(57, 0, 255); // Sets windows background color to blue!
  
  stroke(255, 255, 255); // Sets the color of the outline of shapes drawn below this code white
  
  
  fill (255,8,247); // Sets the color of the shapes under this code to Pink!
  rect(0, 0, 60, 150); // Draws a rectangle (paddle)
  rect(1140, 570, 60, 150); // Draws a rectangle (twin paddle)
  
  fill (87, 245, 56); // Sets the color of shapes drawn below this code light-green
  ellipse(640, 360, 50, 50); // Draws an ellipse (Circle by my measurements)
  
  textSize(40); // Sets size of text under this code to 40
  fill(255); // Sets text color drawn below this code to white!
  text("10", 360, 380); // Writes arbitrary text on screen
  
  text("21", 840, 380); // Writes arbitrary text on screen
  
  
}
