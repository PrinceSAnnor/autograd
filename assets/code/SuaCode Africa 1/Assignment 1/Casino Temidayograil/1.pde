//maxX = 1280, maxY = 720

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  
 background(10);//background is set 
 

stroke(0, 255, 0);//the collour of the outline is set green
fill(255, 0, 0);//the colour of the rectangle is red
rect(0, 0, 25, 300); //a rectangle 
rect(1255,420, 1280, 600); //a rectangle


fill(0, 0, 255);// the cilour of the ellipse is blue
ellipse(640, 360, 50, 50); //an ellipse


textSize(80); //text size is 80
fill(130, 200, 0);// text colour is light green
text("7", 695, 388);// score of the second player 
text("0", 540, 388); //score of the first player
}
