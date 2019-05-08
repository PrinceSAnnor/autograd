//maxX = 2560, maxY = 1440

float screenWidth = 2560; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(167); // sets the background to a specific color
  
  stroke(200, 200, 0);// sets the shapes outline color
  fill(0,0, 0); //sets the paddle color to black 
  
   //draws a rectangle
  rect(1, 1, 40, 200); 
  rect(2520, 1240, 40, 200);
  
  fill(255, 255, 255); // fills ball color to white

  //draws the ball
  ellipse(1280, 720, 60, 60); 


  textSize(70); //set score size to 70
  
  fill(100, 0, 150); //sets score color

  //writes scores on screen
  text("25", 930, 700); 
  text("15", 1630, 700);
}


