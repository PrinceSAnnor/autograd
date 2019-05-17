//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 background(255); //this sets background color to white.
 
 fill(0); //sets the rectangles to black colour.
 stroke(107); //sets outer stroke to gray
 rect(1,0,15,100);
 rect(853,480,-15,-100);
 
 fill(0,0,128);//this sets ball colour to blue
 stroke(107); //sets outer stroke of the ball to gray.
 ellipse(427,240,20,20);
 
 fill(128,0,0); //sets text colour to red
 stroke(107); //sets text stroke to gray
 textSize(30); //sets texts size to 30
 text("3",230,240);
 text("7",624,240);
}



// Coding on my smartphone for the first time is kind of cool and interesting. For the exercise, it made me think out of the box and helped me learn and understand thoroughly the basic concepts taught, as I tried to keep the number of times i referred to the instructions to minimum. I am really learning and still having fun doing that. Thank you SuaCode fir the opportunity.

