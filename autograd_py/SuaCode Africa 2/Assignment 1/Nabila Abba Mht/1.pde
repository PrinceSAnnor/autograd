//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to my maxX
float screenHeight = 720; //set to my maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //run forever
{
  //Code for the background's color
  
  background(0); //Sets the background to be black.
  
  // Code for setting one color for the outlines all shapes 
  
  stroke(0, 255, 255);// sets the color of shapes drawn below this code light blue
  
  //All code for the two paddles 
  
  fill(0, 255, 0); //sets the shapes'colors below to be green
  
  rect(0, 0, 50, 200); // draws one paddle at the top left end

  fill(0, 255, 0); //sets the shapes'colors below to be green
  
  rect(1230, 520, 50, 200); //draws one paddle at the bottom right end

  // All code for the ball
  
  fill(255, 255, 255); //sets the shapes's color below to be white
  
  ellipse (640, 360, 50, 50); //draws an ellipse
   
  //Code for the text size
  
  textSize(70); //sets the size of the text to 70 
  
  //Code for the text's scores
  
  fill(255); //sets the color of text drawn below this code white
  
  text( "0", 470, 350); //writes arbitrary number (zero) at the left side on scree
  
  fill(255); //sets the color of text drawn below this code white
  
  text ("5", 800, 350); //writes arbitrary number (5) at the right side of screen
  
}
