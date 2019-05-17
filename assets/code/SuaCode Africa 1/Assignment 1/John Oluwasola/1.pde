//maxX = 800, maxY = 480

float screenWidth = 800; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  
background(255, 255, 255);//set the background for the program
  
 // this codes draws Shapes and colour paddles 
  stroke(255, 0, 0); //colour paddle outline
  fill(0, 0, 128); // colour paddle
  rect(15, 15, 50, 150); //draws a rectangle
  rect(738, 312, 50, 150); //draws a rectangle 2

// codes draws ellipse and fill as stroked
  stroke(255, 0, 0); // set the ball outline
  fill(0, 128, 0); //set ball colour
  ellipse(400, 250, 30, 30); //draws an ellipse
  

 // this codes write and display text in this program
 fill(0,0,0);// sets colour of the texts
  textSize(20); //set text size to 20

  text("This is my first program", 20, 450); //writes text on screen
  textSize(30); //set figure sizd to 25
  
  
  // code for ball
  text("5", 330, 255); // write text on screen
  text("2", 447, 255); // write text on screen
  }
  

  




 