//maxX = 800, maxY = 480

float screenWidth = 800; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  fill(0,255,255);
  rect(0,0,30,60);
  rect(770,420,30,60);// for paddle
}

void draw() //runs forever
{
  fill(0,255,0);
  stroke(0,0,0);
  ellipse(400,240,100,100);//draws circle
  textSize(250);
  text("7",200,200);
  text("4", 500,200);
  // I did not know that programming was easy when instructions are laid out to be followed. I enjoyed doing the assigment because it required meticulousness. It has helped me to know another programming language. I look forward to learning more.
}
