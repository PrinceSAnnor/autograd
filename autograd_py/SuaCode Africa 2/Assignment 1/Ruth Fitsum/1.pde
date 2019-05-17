//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//sets the background black
  stroke(128,128,128);//sets the outline of shapes drawn below this code grey
  fill(128,128,128);//sets the color of  shapes below this code grey
  rect(0,0,100,400);//draws rectangle
  rect(1820,680,100,400);//draws rectangle
  stroke(0,0,128);//sets the outline of the shape drawn below this code blue black
  fill(0,0,128);// sets the color of shapes drawn below this code blue black
  ellipse(960,540,50,80);//draws an ellipse
  textSize(100);//set text size to 45
  fill(0,0,128);//sets the color below this code blue black
  text("1",800,540);//writes on the screen
  text("0", 1080,540);//writes on the screen
  
  


}
