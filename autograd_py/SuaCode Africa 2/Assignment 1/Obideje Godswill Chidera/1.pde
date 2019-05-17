//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
background(0);//sets background colour black
stroke(255,0,0);// sets the colour of the outline of shapes drawn below this code red
fill(0,250,0);// sets the colour of shape drawn below green.
rect(1,1,100,300);// draws a rectangle.
rect(1200,400,100,300);//draws a rectangle.
stroke(0);// sets the outline of the shape drawn below this code black.
fill(200);// sets the colour of the shape drawn below grey
ellipse(650,300,100,100);// draws an ellipse
textSize(100);// sets text size to 100
fill(255,0,255);// sets the colour of text drawn below this code purple
text("4", 450,350);// writes text on the screen.
text("0", 780,350);// writes text on the screen.
text("GAME OVER",350,80);// writes text on the screen.
}
