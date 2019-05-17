//maxX = 1794, maxY = 1005

float screenWidth = 1794; //set to your maxX
float screenHeight = 1005; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0, 136, 255); //sets background color sky blue
  
  stroke(0, 0, 255); //sets the color of the outline of paddles blue
  
  fill(255, 255, 0); //sets the color of the paddles yellow
  
  rect(2, 2, 50, 225); //draws the top left paddle
  
  rect(1744, 780, 1792, 1003); //draws the bottom right end paddle
  
  
  stroke(0, 0, 255); //sets the color of the outline of the ball to blue
  
  fill(255, 0, 0); //fill the ball with red color
  
  ellipse(897, 502, 50, 50); //draws the ball
  
  
  textSize(60); //sets text size to 60
  
  fill(255, 0, 0); //sets text color to red like the ball
  
  text("2", 700, 510); //sets the score at the left of the ball
  
  text("4", 1094, 510); //sets the right score
  
}
