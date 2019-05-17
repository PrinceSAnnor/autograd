//maxX = 1280, maxY = 800

float screenWidth = 1280; //set to your maxX
float screenHeight = 800; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200); //sets the background grey 
  
  stroke(0,255,0); //sets the color of the outline of shapes drawn below this code below green 
  
  fill(0,0,255); //sets the color of shapes drawn below this code blue 
  
  rect(0,0,10,200); //drawn a rectangle 
  
  fill(0,0,255); //sets the color of shapes drawn below this code blue 
  
  rect(1280,800,-10,-200); //drawn a rectangle 
  
  fill(255,0,255); //sets the color of shapes drawn below this code purple
  
  ellipse(640,400,20,20); //draws an ellipse 
  
  textSize(50); //sets text size to 50
  
  fill(0); //sets the color of text drawn below this code black 
  
  text("6",500,400); //write text on screen 
  
  fill(0); //sets the color of text drawn below this code black 
  
  text("9",800,400); //writes text on screen 
  
}
