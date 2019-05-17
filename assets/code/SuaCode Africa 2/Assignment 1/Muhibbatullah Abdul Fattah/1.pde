//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

      void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever 
{
  background(200);//sets the background grey 
   stroke(0,255,0);//sets the color of the outline of shape drawn below this code green 
    fill(255,0,0);//sets the color of shape drawn below this code red
     rect(0,30,960,135);//draws a rectangle 
      fill(0,255,255);//set the color of shape drawn below this color light blue 
      ellipse(480,540,50,50);//draws an ellipse 
       textSize(20);//set text size to 20
        fill(0);//set the color of the text drawn below this code light blue
         text("This is my first program",20,270);//writes on screen 
         }