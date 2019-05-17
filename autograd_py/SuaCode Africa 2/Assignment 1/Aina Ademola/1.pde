//maxX = 1280, maxY = 720

float screenWidth = 1280 ; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
  
  
{
  background (150,50,100 );
  
  stroke(0, 0, 200); //to highlight the paddle with blue colour
  fill(200, 0, 0); // fill the paddle with green colour
  rect(0, 0, 30, 100); //Drawing the paddle size
  
  stroke(0, 0, 200); //to highlight the paddle with blue colour
  fill(200,0, 0); // fill the paddle with green colour
  rect(1250, 620, 30, 100); //Drawing the paddle size
 
  stroke(0,0, 200); //to highlight the paddle with blue colour
  fill(50, 255, 50);
  ellipse (640, 360, 40,40); //Drawing the pong
  
  textSize(50); //size of the scores is given
  fill(255); //colour of text is programmed
  text("0",560, 350); // the score and position of the game is written
  text("5", 680, 350); // the score and position of the game is written
  
  
  
  
  
}
