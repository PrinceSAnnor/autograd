//maxX =1024, maxY = 600

float screenWidth = 1024; //set to your maxX
float screenHeight = 600; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0,0,0); //sets background color
  stroke(0,255,0); //sets outline color
  
  //first paddle
  rect(5,5,50,300);
  fill(225,0,0);
  
  //ellipse
  ellipse(512,300,100,100);
  fill(225,225,0);

  
  //second paddle
  rect(969,295,50,300);
  
  
  //numbers
  text(1,362,300);
  text(2,662,300);
  textSize(25);
 
}
