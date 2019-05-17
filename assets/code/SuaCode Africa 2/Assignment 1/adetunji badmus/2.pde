//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{

  background(255); //sets the background grey
  
  stroke(255, 255, 0); //sets the color of the outline of shapes and texts as yellow 

  fill(255, 0, 0); //sets the color of rectangles drawn below this code red

  rect(0, 0, 50, 200); //draws a rectangle
  
  rect(2085, 880, 50, 200); //draws another rectangle
  
  textSize(100); //set text size to 40
  
  fill(0); //sets the color of the text written below this code black
  
  text("0", 930, 500); //writes '0' on the screen 
  
  text("5", 1180, 500); //writes '5' on the screen 

  fill(0, 255, 255); //sets the color of ellipse(circle) drawn below this code blue 

  ellipse(1080, 540, 50, 50); //draws a circle with diameter 50

}
  
  //the lesson note was really explanatory,though I had to go through it 2 times. 
  //it was really nice and the whole course for now really seems like a game.
  //i hope it continues being like that 
  //the assignment1,huuuh. The guide attached to the assignment was really helpful.
  //the only part I found difficult was when co-ordinating the player 2's pad
  //after some deep thinking, I got the best out of it 
  //thanks so much 
  
