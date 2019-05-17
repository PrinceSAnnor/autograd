//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(100,90,128);  //sets the background grey
  
  stroke(0,0,255);
  
  //code for paddles 
  
  fill(0,200,50); //colors the paddles green 

  rect(0,0,20,120); //draws a paddle 
  
  rect(1260,600,20,120); //draws the second paddle
  
  //code for ball 
  
 
  fill(255,255,255); //colors the ball white

  ellipse(640,360,30,30 ); //draws the ball
  
  //code for scores 
  
 
  textSize(30); //set text size to 20
  
  fill(255); //colors the ball white 

 
  text("0",530,370); //left paddle player's score
 
  text("3",730,370); //right paddle player's score
}


/*this first program was fun, no difficulty with
 following instructions. The interface is 
 User friendly too*/
 
