//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0); //sets the background to black
  
  stroke(0, 255, 0); //sets the color of the outline of shapes drawn below this code as green
  
  fill(0, 0, 255); //sets the color of the shapes drawn this code (i.e the paddles) as blue
  rect(0, 0, 50, 200); //draws a rectangle i.e the paddle at the top left end
  rect(1230, 520, 50, 200); //draws a rectangle i.e the paddle at the bottom right end
  
  
  fill(255, 0, 0); //sets the color of the shape drawn below this code (i.e the ball) as red
  ellipse(640, 360, 50, 50); //draws an ellise (i.e the ball) at the centre
  
  
  textSize(60); //set text size (i.e the arbitrary numbers), below this code to 60
  text("1", 500, 360); //writes arbitrary number "1" at the left side screen
  text("3", 750, 360); //writes arbitrary number "3" at the right side of screen
  
  textSize(30); //set text size (i.e comment) below this code to 30
  text("pong interface assignmnent done by ozavize alabi", 100, 600); //writes text on screen
  
}
