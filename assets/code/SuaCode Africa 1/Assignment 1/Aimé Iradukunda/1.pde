//maxX = 2560, maxY = 1440
void setup() //runs once

{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(0);  //sets the background grey
 
  fill  (255,0,0);
  stroke  (0,0,255); 
  rect(0, 0,100,300); //I set the position and the size of the first rectangle 
  
  fill (255,0,0);
  stroke (0,0,255);
  rect(2460,1140,2300,1400); // I set the position of the second rectangle 
  
  fill (255);
  stroke  (255,0,0);
  ellipse (1280,780,80,80);// I set the position and the size of the circle 


  textSize(120); // the text size is set to 120
  fill (255);

  text("0", 800,780); //I input the first text and it's position  

  

  textSize  (120);
  fill (255);
  text("5", 1680,770); // I input the second  text and it's position 
}
