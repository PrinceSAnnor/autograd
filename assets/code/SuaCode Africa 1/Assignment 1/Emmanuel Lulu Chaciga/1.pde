//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//fills the background with black color
  
  stroke(0,255,255);//the edges of paddles are blue
  fill(255,0,255);//fills the paddles with purple
  rect(0,0,20,200);//paddle at top left conner
  rect(1900,880,20,200);//paddle at bottom right conner
  
  stroke(0,255,255);//the edge of the circle is blue
  fill(255);// the circle is filled with white
  ellipse(960,540,20,20);//ball drawn at the centre
  
  fill(255,255,0);//fills the text with color to yellow
  textSize(20);//text set to size 20
  text("2",480,540);//score set for player at the left
  text("7",1440,540);//score set for the player at the right
}
