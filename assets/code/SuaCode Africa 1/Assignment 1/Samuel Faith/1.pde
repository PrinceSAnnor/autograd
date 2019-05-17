//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program ia stopped

{
  background(128,128,128);  //sets the background color to grey
  
  //for both paddles;
  
  stroke(255,255,255);//sets the outline color of the paddle to white
  fill(0,128,0);//sets the paddle colors to deep green
  rect(0, 0, 50, 300); //draws paddle 1
  rect(1230, 420, 50, 300); //draws paddle 2
  
  //for the centre ball;
  
  stroke(0,0,0);//sets the color outline of the centre ball to black
  fill(255,255,0);//sets the color of the centre ball to yellow
  ellipse(640, 360, 50, 50); //draws the centre ball

  //for the numbers on each side of the centre ball;
  
  textSize(47); //set text size to 20
  fill(255,255,255);//sets the text color to white
  text("5", 450, 350); //writes text on screen
  text("8", 830,370); //writes text on screen
  
}

