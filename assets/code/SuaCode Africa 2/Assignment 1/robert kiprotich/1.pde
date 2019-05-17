//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//0 makes the background black
  fill(0,255,0);//makes first paddle green green
  rect(0,0,30,300);//position and size of first paddle
  fill(0,255,0);//makes second paddle  green
  rect(1248,418,30,300);//position and size of the paddle
  fill(255,255,255);//makes the circle white
  ellipse(640,400,55,55);//makes the circle
  textSize(60);//the size of the text 0,5
  fill(255,255,255);//makes text white
  text("0",400,380);//text and its position
  fill(255,255,255);//makes text white
  text("5",850,380);//text and its position
  
  
}
