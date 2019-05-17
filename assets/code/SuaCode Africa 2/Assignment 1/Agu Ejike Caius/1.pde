//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
background(0); //sets the background black
stroke(0,255,0); //sets the outline of shapes drawn below green
fill(0,255,255); //sets the color of shapes drawn below to light blue
rect(0,30,30,300); //draws a paddle by the top left end of the screen
fill(255,255,255); //sets ball to white color

ellipse(1000, 540, 50, 50); //draws an ellipse or ball


textSize(80); //set text size to 80


text("3", 500, 540); //writes 3 on the screen
text("10", 1400,540); //writes 10 on the screen
fill(0,255,255); //sets the color of the shape drawn below to light blue
rect(2130,700,30,300); //draws a paddle by the right bottom end of the screen

}

