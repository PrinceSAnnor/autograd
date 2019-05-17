//maxX = 2200, maxY = 1080

float screenWidth = 2200; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{

fullScreen(); //Sets the program to run in full screen mode
background (255);
}

void draw() //runs forever
{
fill(25,25,25); // Fill rectangles with Black colour
 stroke(0,0,255); // Make outline of rectangles Blue
  rect(0,0,40,230); // Draw first rectangle at the top left corner of the screen
   rect(2160,850,40,230);//Draw second rectangle at the bottom most right corner of the screen
 
stroke(0,0,255);//Make outline of ball Blue
 fill(75,30,100);//Fill ball with colour
  ellipse(1100,540,40,40);//Draw ball at the center of the screen
 
 textSize(40);//Set text size
 text(0,700,540);//Score for Player1 set as 0. Placed on left side of screen.
 text(4,1450,540);//Score for Player2 set as 4. Placed on right side of screen
 
 //Reflection: It was really fun and interesting to write this sort code. 
 //I wasn't too challenged doing it but i got me thinking logically especially 
 //when it came to planning my paddles because i had to consider the size if 
 //the shape and the orientation of my screen to make sure it for exactly as i intended. 
 //A satisfying first assignment.
}
