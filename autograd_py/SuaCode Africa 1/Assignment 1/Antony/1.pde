//maxX = 2260, maxY = 1080

float screenWidth = 2260; //set to your maxX 
float screenHeight = 1080; //set to your maxY 

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(90); //sets the background ash
  
  stroke(0,200,60); //sets the border color for all codes below green
  
 fill(225,40,100); //sets the color of the rectangle red
  
  rect(1,1,100,400); //draws a rectangle on the left hand side of the screen
  
  rect(2150,670,100,400); //draws a rectangle on the right hand side of the screen
  
 fill(220,120,225); //sets the color of the ellipse pink
  
  ellipse(1130,500,50,50); //draws an ellipse in the center of the screen
  
  textSize(70); //sets text size to 70
  
 fill(30,20,220); //sets the text color blue
  
  text("7",900,500); //writes the number 7 on the left hand side of the ball
  
  text("4",1300,500); //writes the number 4 on the right side of the ball
}
