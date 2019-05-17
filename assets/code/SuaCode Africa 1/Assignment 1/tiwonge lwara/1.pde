//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,200,129);//sets the background colour
  
  stroke(0,20,65);// draws the outline with colour
  fill(0,200,0);//fills colour in all shapes drawn after it
  
  rect(0,0,50,200);//first rectangle drawn at top left
  rect(1205,500,50,200);//second rectangle drawn right bottom
  
  fill(20,70,100);//fills all shapes below it with colour
  ellipse(600,250,50,50);// ball positioned at the middle
  
  textSize(50);//size of text
  text("0",300,300);//text to the left side of the ball
  text("5",900,300);// text to the right side of the ball
  
}
