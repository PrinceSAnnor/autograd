//maxX = 100, maxY = 100

float screenWidth = 100; //set to your maxX
float screenHeight = 100; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}


void draw() //runs forever
{
  background(200); //set the backgroind to color grey
  
  fill (255,0,0);//set the 1 rectangle color to red
  rect (0,0,10,50); // initializing  a rectangle 
  
  fill (0,255,0); // sets the 2 rectangle color to green
  rect (100,100,10,50); // initializing a rectangle 
  
  fill (0,0,255);// sets the ball color to blue
  ellipse(50,50,10,10); // initializing a ball
  
  text(1,10,10); // naming rectangle 1 
  
  text (2,100,100);// naming rectangle 2 
  
  textSize(30); // setting the  size of text to 12 
  
  
}
