//maxX = 1440, maxY = 720

float screenWidth = 1440;
float screenHeight = 720;

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuosly until program is stopped
{
  
  background(0); //sets the background black
  
  stroke(0,0,255); // sets the color of the outline of the shape drawn below this code blue
  
  fill(0,128,0); //sets the color of shapes drawn below this code green
  
  rect(0, 0, 100, 300); // draws first rectangle left
  
  rect(1340, 420, 1440, 720); // draws second rectangle right
  
  stroke(255,255,255); // sets the color of the outline of the shape drawn below this code white
  
  fill(255,255,0); // sets the color of shapes drawn below this code yellow
  
  ellipse(720, 360, 100, 100); // draws an ellipse
  
  textSize(30); //set text size to 30
  
  fill(255,255,0); // sets text color
  
  text("10", 500, 360); //writes text on left middle part of the screen
  
  text("20", 1000, 360); //writes text on right middle part of the screen
}

/* MY FIRST CODING EXPERIENCE USING MY PHONE

It was fun coding with my phone for the first time. the lecture notes
are self explanatory. at first i had a little issue alighning
my shapes on the buttom right but after some trials i got the logic. it was really amazing */
