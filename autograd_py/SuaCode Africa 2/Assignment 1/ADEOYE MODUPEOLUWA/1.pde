//maxX = 854 , maxY = 480

float screenWidth = 200; //set to your maxX
float screenHeight = 400; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//sets background color as black  
  
 
  stroke(255);//sets outline colour of the shape to be white
  
  fill(200,0,0);//sets the colour of the shape drawn as red
  
  rect(0,10,50,150);//draws a paddle
 
  
  fill(0,0,200);//sets the colour of the shape drawn as blue
 
  rect(800,310,50,150);//draws a paddle
 
  
  fill(255);//sets the colour of the shape drawn as white
  
  ellipse(400,280,50,50);//draws a ball
 
  textSize(30);//sets the size of text as 30 
  
  text(2, 20,270); //writes text on screen 
  
  text(1,700,300); //writes text on the screen on the left side
  
  }