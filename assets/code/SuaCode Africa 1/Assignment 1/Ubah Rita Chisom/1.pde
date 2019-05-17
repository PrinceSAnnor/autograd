//maxX = 2560, maxY = 1600

float screenWidth = 2560; //set to your maxX
float screenHeight = 1600; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255, 0, 0);
  
  fill(0, 255, 0);
  
  rect(0,350,25,250);
  
  rect(2535,1000,25,250);
  
  fill(255);
  
  ellipse(700,700,60,60);
  
  textSize(60);
  
  text("left moving bar",20,300);
  
  text("Right moving bar",2010,1000);
  
  text("moving ball", 800,800);
}
