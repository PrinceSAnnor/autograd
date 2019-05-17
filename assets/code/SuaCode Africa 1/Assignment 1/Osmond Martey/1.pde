//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever 
{
  
  background(0); //sets the background black 
  stroke(0, 0, 255); //sets the color of the outline of shapes drawn below this code blue
  
  
  //first paddle
  fill(0, 255, 0);
  rect(0, 0, 40, 300);
  
  
  //second paddle
  fill(0, 255, 0);
  rect(1875, 775, 40, 300);
  
  
  //ball
  fill(255, 0, 0); 
  ellipse(960, 540, 50, 50);
  
  
   //numbers
   text(2, 760, 560);
   text(3, 1160, 570);
   textSize(60);
}
 