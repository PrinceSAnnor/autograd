//maxX = 854, maxY = 480

//Program code for a Pong game interface by John Samuel © SuaCode 2019 

//Screen dimension
float screenWidth = 854; //my maxX
float screenHeight = 480; //my maxY

//Program setup
void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  background(255); 
}

//Main program 
void draw() //runs forever
{
  strokeWeight(2); //thin border outline for ball and paddles
  stroke(255,255,0); //border outline for ball and paddle is set to yellow 
  
  fill(0,255,0); //ball is colored light green 
  ellipse(427,240,50,50); //creates ball
  
  fill(255,0,0); //two paddles are colored red
  rect(0,0,50,150); //creates paddle1
  rect(804,330,50,150); //creates paddle2
  
  textSize(35); //Sets score size
  text(9,300,240); //Sets score for paddle1 
  text(6,535,240); //Sets score for paddle2
  
}
