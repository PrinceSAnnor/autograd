//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (0);// sets background color to black
  
  fill(0,255,0);//sets paddle colour to green
  rect(1770,830,150,250);//draws bottom paddle with 150mm width and 250mm length
  rect(0,0,150,250);//draws upper paddle with 150mm width and 250mm length
  
  fill(0,0,255);//sets ball color to blue
  ellipse(960,540,150,150);//draws ball at the center with radius 75
  
  textSize(70);// sets text size to 70mm
  fill(255,0,0);// sets text color to red
  text('3',500,560);//writes 3 to the left hand side
  text('5',1420,560);// writes 5 to the right hand side
  
}
