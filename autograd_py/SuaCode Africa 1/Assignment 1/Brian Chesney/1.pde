//maxX = 1920, maxY = 1200

float screenWidth = 1920; //set to your maxX
float screenHeight = 1200; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
background(0,225,225); // sets background to turquoise 

stroke(225); // set outline of shapes below this code to white

fill(225,225,0); // set colours of shapes below this  code to yellow
rect(0,0,50,150); // draws rectangle
rect(1870,1050,50,150); // draws rectangle

fill(0,225,0); //set colour of shape below this code to green
ellipse(960,550,100,100); // draws a circle

textSize(50); // set text size to 50
fill(0); // sets colour of text below this code to black
text("20",610,550); //writes text on screen
text("6",1310,550); // writes text on screen

}
