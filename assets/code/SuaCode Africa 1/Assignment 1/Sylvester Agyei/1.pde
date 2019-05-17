//maxX = ***, maxY = ***

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (200);//sets background color
  stroke(0,255,0);//outline color
  fill(255,0,255);// interior color
  rect(0,0,50,350);// rectangle at the beginning
  rect(1390,370,50,350);// rectangle at far end
  fill(0,0,255);// a different color for the circle
  ellipse(720,360,40,40);// a circle
  stroke(255,0,0); //a color for the text.
  textSize(20);// sets a fomt size
  text("player 1 ",600,40); // displays player 1
  text("25", 600,70);// score for player 1
  text("player 2",840,40); //displays player 2
  text("0",840,70);// score for player 2
}
