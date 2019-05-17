//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
                   
}

void draw() //runs forever
{
  background(225,0,0); // set background color to red
  
  fill (0,225,0); // set interior of the rectangles to green
  stroke (0); // set the color used to draw lines around  rectangles
  rect (0,0,30,200); // draws rectangle at the upper left
  rect (1920,1080,-30,-200); // draws rectangle at the lower right
  
  
  fill (0,0,225);// set interior color of the cirle to indigo
  stroke (0);  // set the color used to draw the circle
  ellipse ( 960, 540, 100, 100); //draws a circle
  
  textSize (100); // set the size of the text to 100
  fill (0,0,225); // set interior color of the text to indigo
  stroke (0); // set color used to draw lines and borders of the text
  text (0, 700, 580); // writes a number (0) at the middle left side
  text (2, 1210, 580); // writes a number (2) at the middle left side
  
  
 }

// it was fun and interesting even though i used about 3 to 4 days to finish.
//Some parts were difficult since it was the first time,including;
// the possitions and individual size of the paddles, ball and items on the screen
//that is it, can't wait to do more.thank you.