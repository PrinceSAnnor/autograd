//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,255,255);//sets the background light blue
  stroke(255,0,255);//sets the color of the outp}ne of shapes drawn below this code below purple
  fill(0,0,128);//sets the color of shapes drawn below this code dark blue
  rect(0,0,50,200);//draws a rectangle
  rect(1230,520,50,200);//draws a rectangle
  fill(0);//sets th= color of shapes drawn below this code black
  ellipse(640,360,20,20);//draws an ellipse
  textSize(40);//set text size to 40
  fill(0);//sets the color of text drawn below this code black
  text("1",550,360);//writes text on screen
  text("4",750,360);//writes text on screen
  
}
