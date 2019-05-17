//maxX = 1280, maxY = 800

float screenWidth = 1280; //set to your maxX
float screenHeight = 800; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
 
  background (255,0,255); //Sets background color to purple
    
    stroke (0,0,255); //Sets blue outline for both paddle
    fill (100,255,100);     // Sets green color for both paddle
    rect (0,0,10,50);  // draws the left paddle
    rect (1270,750,10,50);  // draws the right paddle
  
        stroke (0,0,255);         // Sets blue outline for the ball
        fill (255,255,255);       // Sets ball colour to white
        ellipse (640,400,20,20);  // draws the ball
    
            textSize (40);        //sets text size for left score to 40
            text ("3",580,400);   // Writes the score on the left side
            text ("8",700,400);   // Writes the score on the right side
       
}
