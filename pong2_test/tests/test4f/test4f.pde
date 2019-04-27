int ballX;//declare variable to hold x position of ball
float ballY;//declare variable to hold y position of ball
float diameter=20;//declare and initialize to variable to hold size of ball

void setup()
{
  fullScreen(); //set the size of drawing window
  background(0); //set background color to black
  stroke(0,0,255); //set the outline of objects to blue
  ballX=width/2;//initialize x value
  ballY=height/2;//initialize y value
 }
 
 void draw()
 {
  background(0);//continues set background color to black
  fill(255,255,255); //set the interior of text in white
  textSize(45); //set text size to 45
  text("6",width/5, height/2); //writes text on screen
  text("2",width/1.25, height/2); //writes text on screen
  
  fill(0,255,0); //set the interior of object in green
  rect(mouseX,mouseY, width/30,height/8); //draws a rectangle
  rect(1230,620,width/30,height/8); //draws a rectangle

 fill(255); //set the interior of object in yellow
 ellipse(ballX,ballY,diameter,diameter); //create ball with varialble

//move ball up and left
ballX=ballX-4;
ballY=ballY-2;

}

