//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);
  stroke(2555,0,0);//gives outline to all shapes colour red
  //paddles
  fill(0,255,0); //fills the paddles with color green
  rect(0,0,40,90);// top left paddle
  rect(1240,630,40,90);//bottom right paddle
  //circle
  fill(255,255,255);//fills ball with white color
  ellipse(640,360,50,50);//ball
  //text
  textSize(50);//sets text size to 50
  text("1",490,350);//first score
  text("3",790,350);//second score
}
