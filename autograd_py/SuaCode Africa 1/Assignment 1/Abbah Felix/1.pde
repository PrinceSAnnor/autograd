//maxX = 1024, maxY = 600

float screenWidth = 1024; //Value of maxX
float screenHeight = 600; //Value of maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped 
{
 
 background(0); // Set background as black 
 
 
 // Display The Two Paddles
 
 stroke(255,255,255);// set stroke as white 
 
 fill (0,0,255);// set paddles as Blue 
 
 rect(0,0,100,200);// 1st paddle 
 
 rect(1024,600,-100,-200);// 2nd paddle 
 
 
 // Display Ellipse Ball
 
 stroke (255,255,255);// set stroke as black 
 
 fill(255,255,255);// set ellipse as white 

 ellipse (512,300,45,45);// set shape of the ellipse ball
 
 
 // Display Text and Scores 
 
 textSize(60);// set text size at 60
 
 stroke(255,255,255);// set the strokes as White 
 
 fill(255,0,255);// set the color of scores as Red
 
 text(2,350,300);// Left player Score 
 
 text(9,650,300);// Right player Score 
  
}
