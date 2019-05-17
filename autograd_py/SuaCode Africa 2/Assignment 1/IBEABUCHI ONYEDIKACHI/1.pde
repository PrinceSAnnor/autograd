//maxX = ***, maxY = ***

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY


void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); //set black as backgorund colour
  
  fill(0,255,0); //set green as rectangles colour
    rect(0,0,30,170); //left rectangle
  rect(1235,550,30,170); //right rectangle
  
  fill(255); //set ball colour to white
  ellipse(640,360,60,60); //ball
  
  textSize(50); //set text size to 50
  text("3", 450, 360); //Left Player Score
  text("6", 800, 360); //Right Player Score
  
}
