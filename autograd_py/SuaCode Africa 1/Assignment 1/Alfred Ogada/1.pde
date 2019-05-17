//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(0);// sets the background to black
 
 stroke(0,128,0); // sets the outline colour of the shape below to green
 
 fill(0,0,128); // sets the colour of the shape below to indigo
 
 rect(0,0,60,200); // draws the left side rectangle
 
 rect(1860,880,60,200); //draws the right side rectangle
 
 fill(255,255,0); // sets the colour of the shape below to yellow
 
 ellipse(960,540,50,50); // draws the ellipse
 
 textSize(50); //set text size to 50
 
 text("15",760,540); // writes 15 on the screen
 
 text("40",1160,540); // writes 40 on the screen
 
}
