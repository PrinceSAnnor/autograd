//maxX = 1428 , maxY = 720 

float screenWidth = 1428 ; //set to your maxX
float screenHeight = 720 ; //set to your maxY

void setup() 

{

  fullScreen();
  //Sets the program to run in full screen mode
} 

void draw() 

{

  background(0);//sets background black



  stroke(0, 0, 255);//sets outline color of shapes below green 
  fill(0, 255, 0);//colors shapes below  green 
  rect(0, 0, 120, 180);//draws a rectangle



  stroke(0, 0, 255);// outlines shapes below blue
  fill(0, 255, 0);// colors shapes below green
  rect(1250, 550, 120, 180);//draws a rectangle



  fill(255);//colors shapes below white 
  ellipse(714, 360, 60, 60);//draws an ellipse



  textSize(50);// sets text size to 20 for text below 
  fill(255);// set text color white for text below 
  text("5", 514, 360);// writes text on screen                   
  text("10", 914, 360);// writes text on screen
} 
