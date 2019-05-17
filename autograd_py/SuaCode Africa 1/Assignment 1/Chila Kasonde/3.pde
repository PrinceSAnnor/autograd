//maxX = ***, maxY = ***

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200);//sets background color of interface
  
  fill(0,255,255); //sets color for all objects that are after it
  stroke(0,255,0);//sets outline color for all objects to follow
  rect(0,30,20,90);//creates a rectangle shape this is the first one player one
  rect(1418,600,20,90);//creates rectangle number two
  fill(255,255,255);//once again sets color for objects under it in this case the text
  text("0", 590,350);// sets texts location and value
  textSize(50); //sets text size of all texts objects under it
  text("5", 800,350);//sets texts location and value
  fill(255,0,0);//sets color
  ellipse(705,350,50,50); //creates an ellipse
  
}
