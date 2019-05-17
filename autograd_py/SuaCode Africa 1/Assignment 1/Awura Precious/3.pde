//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(233);//background colour
  
  stroke(78,80,57);// outline colour
  
  //code of rectangle
  fill(0,220,3);//colour fill of rectangle
  
  rect(0,0,30,150);//left corner rectangle 
  
  rect(2530,1290,30,150);// right bottom rectangle
  
  fill( 60,60,60);//colour fill for circle
  
  ellipse(1280,720,80,80);//circle
  
  text(6,1000,722);//left number
  
  text(8,1560,722);//right number
  
  textSize(80);// size of the text
  
  
  
}
