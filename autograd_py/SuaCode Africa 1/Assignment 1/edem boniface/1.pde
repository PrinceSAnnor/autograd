//maxX = 2560, maxY = 1440

float screenWidth = 2500; //set to your maxX
float screenHeight = 1400; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
background (150); // sets the background color light grey

stroke (0, 255, 0); // sets the left paddle  outline color green 

fill (200, 80, 80); // sets the left paddle fill color crimson red

rect (0, 0, 100, 500); // draws the left paddle 

stroke (0, 255, 0); // sets the right paddle outline color green

fill (200, 80, 80); // sets the right paddle fill color crimson red

rect (2455, 935, 100, 500); // draws the right paddle 

stroke (0, 255, 0); // sets the outline color for the ellipse green
 
fill (80); // sets the ellipse fill color dark grey

ellipse (1200,700, 70, 70); // draws an elipse at the center of the screen

textSize (50); // set text size to 50

text ("0", 1100, 720); // places the first number in front of the ellipse 

text  ("5", 1300, 720); // places the second character after the ellipse 
}
