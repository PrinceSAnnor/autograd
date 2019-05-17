//The lesson note was very helpful.
//It's a very interesting assignment.
//Challenging but interesting.
//I had some difficulties with positioning the paddles but i solved it.
//I'm ready to play my game. Thanks SuaCode❤

//maxX = 1280, maxY = 720

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(120,144,156);  //sets the background color
  
  fill(184,212,0);//sets the color of the rectangle below
  stroke(184,212,0);//sets the outline color of the rectangle below
  rect(0,0,50,200 ); //draws a rectangle
  
  fill(255,255,255);//sets the color of the text below
  text("3",500,360);//displays a text on the screen according to it's respective position
  
  fill(251,141,0);//sets the color of the ellipse below
  stroke(251,141,0);//sets the outline color of the ellipse below
  ellipse(640,360, 40, 40); //draws an ellipse
  
  fill(255,255,255);//sets the color of the text below
  text("9",755,360);//displays a text on the screen according to it's respective position
  textSize(45); //set text size to 45
  
  fill(184,212,0);//sets the color of the rectangle below
  stroke(184,212,0);//sets the outline color of the rectangle below
  rect(1230,520,50,200 ); //draws a rectangle


  
}
