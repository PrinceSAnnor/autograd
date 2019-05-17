//maxX = 1280, maxY = 720

float screenWidth_X = 1280; //sets my maxX
float screenHeight_Y = 720; //sets my maxY

void setup() //runs once
{
  fullScreen(); //sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(175); //sets the colour for thecwindow
  
  stroke(255,0,0); //sets the oultine colour of the shapes below white
  fill(0,200,0); //sets the interior colour of the shapes below green unless otherwise is written.
  rect(0,0,75,300); //draws the leftmost paddle
  rect(1205,420,75,300); //draws the rightmost paddle
  
  fill(0); //sets the interior colour of the ball  and that of the text
  ellipse(640,360,50,50); //draws the ball at the center
  
  textSize(35); //this line of code sets the size of the text
  text("1",540,360); // sets a number representing the left player's score
  text("0",720,360); // sets a number representing the right player's score
}
