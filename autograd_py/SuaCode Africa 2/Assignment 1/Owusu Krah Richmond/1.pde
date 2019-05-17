//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
background(0); //sets the background color black

stroke(255,255,255); //sets the color ofthe shape below the code white

fill(255,255,0); // sets the color of the shape below the code yellow

rect(0,0,70,200); //draws a rectangle

rect(1360,500,70,880); // draws a rectangle

stroke(255,255,255); // sets the color of the shape below the code white

fill(0,255,0); //sets the color of the shape green

ellipse(700,350,60,60); // draws an ellipse

textSize(70); // sets text size 70 

text("4                                 2",350,450); // 
}

