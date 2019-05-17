//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{ background(0,50,0); //sets background color to green
//codes for both paddles
     fill(255,0,0); //sets color of shape to red
       stroke(0); //sets line color to black
    rect(0,0,25,150); //draws paddle on the top left corner
       rect(1415,570,25,150);//draws paddle of same size at the bottom right corner
 //codes for the ball
 fill(255,255,255);//sets the color of the shape(ball) to be white
          stroke(0);
   ellipse(720,360,30,30);//draws a cycle(ellipse with width and height equal) 
 //codes for texts
            textSize(50);//sets the text size to be 40
         text("4      :",620,75);  //writes a text of the first paddle signifying its score
             text("1",800,75);//writes a text showing the score of second player
}
