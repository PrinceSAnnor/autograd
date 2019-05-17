//maxX = 1280, maxY = 720

float screenWidth = 1280 ; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,255,255);//sets the background light blue
  stroke(255);//sets the color of the outline shapes below this code white
  fill(255,0,255);// sets the color of shapes drawn below this code purple
  rect(0,0,50,200);//draws a rectangle
  rect(1230,520,50,200);//draws a rectangle
  fill(128);//sets the color of shapes drawn below this code grey
  ellipse(640,360,50,50);//draws an ellipse
  textSize(50);//set text size to 50
  fill(0);//sets the color of the text drawn below this code black
  text("1",440,360);//writes text on screen
  text("5",840,360);//writes text on screen
  
  
  
}
