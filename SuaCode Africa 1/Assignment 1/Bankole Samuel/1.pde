//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
background(0,0,255);  //sets the backgrouund blue
  stroke(0,255,0);  //sets the color of the outline to green
  fill(255,255,255);  //sets the color of shape to white

  rect(0, 0, 20, 80); //draws a rectangle
  
stroke(0,255,0);  //sets the color of the outline to green
  fill(255,255,255);  //sets the color of shape to white

  rect(1260, 640, 20, 80); //draws a rectangle



  ellipse(640, 365, 30, 30); //draws an ellipse


  textSize(35); //set text size to 35


  text("5", 530, 367); //writes text on screen

  textSize(35); //set text size to 35


  text("6", 725, 367); //writes text on screen
}

