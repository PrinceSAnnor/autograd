//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
 
{
  background(0); //sets the background color black
  
  stroke(255,0,0); //sets the outline of the shapes below red
  
  //codes for the paddles
  
  fill(0,0,255); //sets the color of the paddles blue
  
  rect(0,0,55,200); //draws the paddle at the top-left
  
  rect(1225,520,55,200); //draws the paddle at the bottom-right
  
  //codes for the ball
  
  fill(255,255,255); //sets the color of the ball to white
  
  ellipse(640,360,50,50); //draws the ball at the center
  
  //codes for the players' scores
  
  textSize(50); //sets textSize(scores) to 50
  
  fill(255,255,0); //sets the color of the players' scores to yellow
  
  text("5",510,360); //writes the score of the left player
  
  text("6",750,360); //writes the score of the right player
}
