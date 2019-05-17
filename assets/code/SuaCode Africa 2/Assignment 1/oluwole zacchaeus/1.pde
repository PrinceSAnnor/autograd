//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  
  background(200); //sets the background grey
  stroke(255,0,0); // sets red for the outline shape colours
  
  fill(0,0,128);   // sets the colour of the shape below this code blue
  rect(0,0,50,250); // draw a rectangle for the first paddle
  fill(0,128,0);    // sets the colour of the shape below this code green
  rect(1230,470,50,250); //draw a rectangle for the second paddle
 
  fill(0,0,0);       // sets the colour of the shape below this code black
  ellipse(640,360,40,40); // draw a ball at the centre 

  textSize(40);      // left score text size 
  text("4",440,360); // left score text 
  textSize(40);      // right score text size 
  text("5",840,360); // right score text
}
