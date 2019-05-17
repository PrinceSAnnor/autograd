//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255,255,255); //sets background to black
  
  stroke(255,0,0); //set colour of the outline of the shape below as black
  
  fill(0,0,255); //set colour of the inner part of the shape below to blue
  
  rect(0,0,50,100); //draws rectangle
  
  rect(1229,619,50,100); //draws rectangle
  
  stroke(255,0,0); //set the outline colour of the shape below to red
  
  fill(255,255,0); //set inner colour of the shape below to yellow
   
  ellipse(640,360,50,50); //draws a circle
  
  textSize(50); //set below text size to indicated point
  
  fill(0); //set the colour of the text below to white
  
  text(0,500,380); 
  
  text(5,750,380);
  
}

