//maxX = 480, maxY = 960

float screenWidth = 480; //set to your maxX
float screenHeight = 960; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255); // the background of my pong game.
  
  //the two paddle for the pong game
  stroke(255,255,0); 
  
  fill(0,255,0);
  
  rect(0,0,10,100); // top-left paddle
  
  rect(960,480,-10,-100); // bottom-right paddle
  
  
  //the ponk game ball
  fill(255,0,0);
  
  stroke(255,255,0);
  
  ellipse(480,240,30,30); //ball at the center
  
  
  //the pong game scores
  textSize(25);
  
  fill(0);
  
  text("3",350,240); // left player's scores
  
  text("6",610,240); // right player's scores
}
