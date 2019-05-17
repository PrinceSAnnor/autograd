//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode 
}

void draw() //runs forever
{
  background(70, 130, 180);  // set the background  power blue
  
  stroke(255, 0, 0);  // sets the color of the ouline of the paddles drawn below red
  
  fill(0, 255, 0);   // set the color of the paddles drawn below this code green
  
  rect(0, 0, 50, 170); // draw the first paddle
  
  rect(1440, 720, -50, -170); // draw the second paddle
  
  
  stroke(255); // sets the color of the ouline of the ball drawn below white
  
  fill(165, 42, 42); // set the color of the ball drawn below this code brown
  
  ellipse(720, 360, 40, 40); // draw a ball
  
  
  textSize(60); // set the size of the text 60
  
  fill(0); // set the color of the text black
  
  text("9", 360,360); // write the first score on the screen
  
  text("6", 1080, 360); // write the second score on the screen
}
