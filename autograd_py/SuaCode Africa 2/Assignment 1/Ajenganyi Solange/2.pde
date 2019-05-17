//maxX = 1440, maxY = 720

float screenWidth = 720; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(0, 0, 128); //sets the background purple
  
  stroke(128); //set the color of the outline of shapes drawn below this code below purple
  
  
  fill(0, 255, 255); // set the color of the shape drawn below this code green
  
    rect(0, 0, 30, 125); // draws a rectangle
    
  
  fill(255, 255, 255); // set the color of the shape drawn below this code white
  
    ellipse(720, 360, 50, 50); //draws an ellipse
   
 fill(255); //set color of the text white
     
  textSize(50); //set text size to 50
   
     text("2", 530, 380); //writes the text on the screen

      text("4", 930, 385); //writes text on the srceen
 
  
  fill(0, 255, 255); // set the color of the shape drawn below this code cyan
   
    rect(1410, 600, 30, 120); // draws a rectangle
  
  
}
