//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(255);  //sets the background white

  stroke(0, 255, 0); //sets the color of the outline of the shape drawn below this code green
  fill(255, 0, 0); //sets the color of shape drawn below this code red
  rect(0, 0, 50,150 ); //draws a rectangle
  
  stroke(0, 255, 0); //sets the color of the outline of shapes drawn below this code green
  fill(255, 0, 0); //sets the color of shape drawn below this code red
  rect(1230, 570, 50, 150); //draws a rectangle

 stroke(0, 255, 0); //sets the color of the outline of the shape drawn below this code green
   
fill(0, 0, 255); //sets the color of shape drawn below this code blue
 ellipse(640, 360, 50, 50); //draws a circle


  textSize(40); //set text size to 40

  stroke(0, 255, 0); //sets the color of the outline of the text drawn below this code below green
  text("1", 440, 360); //writes text on screen

  stroke(0, 255, 0); //sets the color of the outline of the text drawn below this code below green
  text("2", 840, 360); //writes text on screen
}

