//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(100);//sets the background to ashy-hue
  
  
  fill(0,255,0);//sets the color of the outlines of the rectangles red
  stroke(255,0,0);//sets the color of the inside shapes of the rectangles green
  
  rect(0, 0, 50, 300); // draws the top-left paddle 
  rect(1875, 775, 50, 300);//draws the bottom-right paddle
  
  
  
  fill(0, 500, 500);//sets the color of the pong and scores blue
  
  ellipse(900, 550, 60, 55); // draws an ellipse
  

  
  text("0", 600, 550);// writes first player's score on the screen
  text("1", 1200, 550);//writes my own score on the screen since I'm winning! Lol
  
  textSize(30);//sets the text size to 40
  
  
  
}
