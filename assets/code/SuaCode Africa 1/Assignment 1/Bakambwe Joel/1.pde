//maxX = **1280*, maxY = **720*

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
}

void draw() //runs continuously until the program is stopped
{
  background(0);  //sets the background grey
  fill(255, 255, 255); //giving the white color to my paddles
  rect(0, 0, 30, 100); //draws a rectangle
  fill(255, 255, 255);//giving the white color to my paddles
  rect(1250, 600, 30, 120);

  fill(0, 128, 0);//giving the green color to the center ball
  ellipse(640, 360, 50, 50); //draws an ellipse


  textSize(50); //set text size to 20

  fill(0, 128, 0);//giving the color to the text in center(the number beside the ball) 

  text("0", 450, 360 ); //writes text on screen0

  text("5", 900, 360 );
}
