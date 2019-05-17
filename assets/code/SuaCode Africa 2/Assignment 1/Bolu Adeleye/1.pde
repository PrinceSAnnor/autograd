//maxX = 960, maxY = 480

float screenWidth = 960; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
}

void draw() //runs forever
{
  background(0); //sets background colour to black
  fill(0,0,250); //blue colour for the paddles
  stroke(255,0,0);//red outline for the shapes
  rect(5,5,50,150);//top left corner paddle
  rect(905,325,50,150);//bottom right corner paddle
  fill(255,255,255);//white text and circle
  ellipse(480,240,50,50);//centre circle
  textSize(30);//display size of score
  text("4",280,240);//left player's score
  text("0",680,240);//right player's score
}
