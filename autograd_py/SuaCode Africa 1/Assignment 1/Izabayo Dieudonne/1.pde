//maxX = 960, maxY = 480

float screenWidth = 960; //Sets to maxX
float screenHeight = 480; //Sets to maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (0);//sets background to black
  
  //Paddles
  stroke(0,0,128);//sets the outline color of the rectangle below this code blue
  fill(0,128,0);//sets the color of the rectangle below this code green
  rect(0,0,25,100);//draws a rectangle(left paddle)
  
  stroke(0,0,128);//sets the outline color of the rectangle below this code blue
  fill(0,128,0);// sets the color of the rectangle below this code green
  rect(935,380,25,100);//draws a rectangle(right paddle)
  
  //Ball
  stroke(0,0,128);//sets the outline color of the circle below this code blue
  fill(128,128,128);//sets the color of the circle below this code grey
  ellipse(480,240,50,50);// draw the circle of radius 50(ball)
  
  //Scores
  textSize(50);//sets the size of the text below this code to 50
  fill(128);//sets the color of the text below this code grey
  text("1" ,360,240);//writes text(left score) on screen
  
  textSize(50);//sets the size of the text below this code to 50
  fill(128);//sets the color of the text below this code grey
  text("5" ,600,240);//writes text(right score) on screen
  
}
