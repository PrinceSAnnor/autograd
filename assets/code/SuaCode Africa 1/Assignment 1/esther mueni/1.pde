//maxX = 1280, maxY = 720

float screenWidth = 1280;//set to your maxX
float screenHeight = 720;//set to your maxY

 void setup()//runs once
{
  fullScreen(); //Sets the program to run in full screen
  background(200); //sets the background grey
}

  void draw() //runs forever
{

stroke(0,255,0); //sets colour of the outline of shapes drawn below this code green
fill(0,255,255); //sets the colour of shapes drawn below this code light blue
rect(0,0,50,200); //draws a rectangle on the top left 


fill(0,255,255); //sets the colour of shapes drawn below this code light blue
rect(1230,520,50,200); //draws a rectangle on the bottom right 


fill(255,0,0); //sets the clour of shapes drawn below this code red
ellipse(620,360,50,50); //draw a circle at the centre

size(50); //set text size to 20
text("2",520,360); //writes text on the left side ofthe screen
text("10",700,360); // writes text on the right side of the screen
  
}
