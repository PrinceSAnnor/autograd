//maxX = 1920, maxY = 1080

//maxX = 1920, maxY = 1080

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(#000000);  //sets the background black
  
  
  stroke(#076ABD); //sets the color of the outline of shapes drawn below this code below blue


  fill(#19E338); //sets the color of shapes drawn below this code green
  
  
  rect(0, 0, 100, 300); //draws a rectangle
  
  
  stroke(#076ABD); //sets the color of the outline of shapes drawn below this code below blue


  fill(#19E338); //sets the color of shapes drawn below this code green
  
  
  rect(1810, 770, 100, 300); //draws a rectangle
  
  
  stroke(#076ABD); //sets the color of the outline of shapes drawn below this code below blue
  
  
  fill(#FFFFFF); //sets the color of shapes drawn below this code light white


  ellipse(960, 540, 50, 50); //draws an ellipse


  textSize(50); //set text size to 50
  
  
  fill(#FFFFFF); //sets the color of text drawn below this code white


  text("0", 800, 540); //writes text on screen
  
  
  textSize(50); //set text size to 50
  
  
  fill(#FFFFFF); //sets the color of text drawn below this code black


  text("5", 1100, 540); //writes text on screen
}
