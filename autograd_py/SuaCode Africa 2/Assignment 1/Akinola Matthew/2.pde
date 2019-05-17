//maxX = 2255, maxY = 1080

float screenWidth = 2255; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{

  background(0); //the background of the game interface is black
  
  stroke(255, 0, 0); //the outline color of the paddles is red
  
  fill(0,128,0); //the interior color for the paddles is forest green
  
  rect(5,100,50,250); // the paddle at the top left corner
  
  stroke(255, 0, 0); //the outline color of the paddles is red
  
  fill(0,128,0); //the interior color for the paddles is forest green
  
  rect(2085,800,50,250); // the paddle at the bottom right corner 
  
   stroke(0,128, 0); //the outline color of the ball is green
  
  fill(255, 0, 0); //the interior color for the ball is red
  
  ellipse(1050, 550, 50, 50); //the ball
  
  textSize(50); //the size of the text for the left side player's score
  
  fill(255, 255, 255); //the color of the text for the left side player's score is white
  
  text("15", 750, 550); //the text for the left side player's score
  
  textSize(50); //the size of the text for the right side player's score
  
  fill(255, 255, 255); //the color of the text for the right side player's score is white
  
  text("35", 1350, 550); //the text for the right side player's score
 
  
}
