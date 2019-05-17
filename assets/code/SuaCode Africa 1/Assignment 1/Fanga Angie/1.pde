//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255); // Sets the background white 
  stroke(0, 0, 255); // Sets the color of the outline of shapes drawn below this code below blue
  fill(255, 0, 255); // Sets the color of the paddles purple
  rect(0, 0, 200, 500); // draw a paddle at the top left end
  rect(2358, 1000, 200, 500); // draw another paddle at the bottom right end
  
  fill(255, 0, 0); // Sets the color of the ball red
  ellipse(1300, 800, 100, 100); //draw a ball at the center
  
  textSize(90);// Sets text size to 90
  text("4", 900, 800); // writes number at the left side of the screen
  text("2", 1700,800); // writes number at the right side of the screen 
}

