//maxX = 960, maxY = 540

float screenWidth = 960; //set to your maxX
float screenHeight = 540; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200);  //sets the background grey
  
  stroke (0,225,0); //sets the color of the outline of shapes drawn below this code green

  fill(0,0,225); //sets the color of shapes drawn below this code blue
   
  rect(0, 0, 40, 150); //draws a rectangle
  
  rect (920,390,40,150); //draws a rectangle 
  
  fill (0); //sets the color of shapes drawn below this code black 
  
  ellipse (480,270,30,30); //draws an ellipse 
  
  textSize (40); //set text size to 40
  
  fill (0); //sets the color of text drawn below this code black
  
  text ("7",320,270); //writes text on screen
  
  text ("8",640,270); //writes text on screen

}
