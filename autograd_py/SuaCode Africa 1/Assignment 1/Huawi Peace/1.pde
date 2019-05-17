//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (100);
  //creation paddles
  stroke(245,211,50); //sets outline color for paddles
  fill(125,100,215); //sets the color of the paddles
  rect(5,5,20,65); //top left paddle
  rect(829,410,20,65);//bottom right paddle
  
  //creation of ball using ellipse
  stroke(100,100,100); //sets outline color for ball
  fill(255,255,0); //sets color for ball
  ellipse(427,240,20,20);//ping-pong ball drawn using ellipse
  
  //creation of scores
  stroke(100,100,100); //sets outline color for scores
  fill(30,255,235); //sets color for scores
  textSize(20); // size of the text or score
  text(3,357,240); //score at the left for the top left paddle
  text(7,497,240); //score at the right for the bottom right paddle
  
}
