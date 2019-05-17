//maxX = 1280, maxY = 800

float screenWidth = 1280; //set to your maxX
float screenHeight = 800; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
   background(200);  //sets the background grey
  
  stroke (0, 255, 0); //sets te colour to green
  fill (255, 0, 0);  //sets colour to red

  rect(0, 0, 640, 115); // left paddle
  rect(640, 683, 640, 115); // right paddle
  
  fill (0, 255, 255); //sets colour to light blue



  ellipse(320, 400, 80, 80); //draws an ellipse


  textSize(20); //set text size to 20
  fill (0); //sets colour to black

  text("player 1", 50, 170); //writes text on screen
  text("player 2", 1150, 640); // writes text on screen
      

}

