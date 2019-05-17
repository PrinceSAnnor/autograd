//maxX = 1280, maxY = 720

float screenWidth = 1280;//set to your maxX
float screenHeight= 720 ;//set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
   background(0);//sets background black
   
   stroke(0,0,255);//sets the color of the outline of shapes drawn below this code white
   
   fill(0,255,0);//sets the color of shapes draw below this code blue
   
   
   rect(0,0,50,100);//draws a rectangle to the left
   
   rect (1230,620,50,100);//draws a rectangle to the right
   
   fill(255,255,255);//sets the color of shapes drawn below this code white
   
   
   ellipse(600,350,25,25);//draws an ellipse
   
   textSize(20);//set text size to 20
  fill(255);//sets the color of text drawn below this code white
   
   
   text("4",500,350);//writes text on screen to the left
   
   text("3",700,350);//writes text on screen to the right
   
   
  
}
