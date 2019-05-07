//maxX = 1920, maxY = 1080

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  
  
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
   background(200);//set the background to grey
    stroke(0,255,0);
    fill(0,0,255);
    rect(0,30,960,135);//draws a rectangle
    ellipse(480,540,50,50);//draws an ellipse
    fill(0);
    textSize(20);//sets the text size to 20
    text("My First Assignment", 20,270);//prints the My First Aasingment on the screen
    
    
    
}
