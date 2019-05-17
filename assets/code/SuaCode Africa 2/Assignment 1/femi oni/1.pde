//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{

background(128, 128, 128); //set the background black

stroke(255, 255, 0); //set the color of the outlines of shapes drawn below this code yellow

fill(0, 0, 128); //set the color of shape drawn below this code dark blue

rect(0, 0, 50, 150); //draw a rectangle

fill(0, 0, 128); //set the color of shape drawn below this code dark blue

rect(1228, 568, 50, 150); //draw a rectangle

fill(128, 0, 0); //set the color of shape drawn below this code dark red

ellipse(600, 300, 70, 70); //draw an ellipse

textSize(50); //set text size to 30

fill(0, 255, 0); //set the color of shape drawn below this code light green

text("19", 400, 320); //write text on screen

fill(0, 255, 0); //set the color of shape drawn below this code light green

text("11", 780, 320); // write text on screen
}

