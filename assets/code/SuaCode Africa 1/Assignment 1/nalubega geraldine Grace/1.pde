//maxX = 2550, maxY = 1440

float screenWidth = 2550; //set to your maxX
float screenHeight = 1440; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  background(128,128,128); // sets the background color as grey
  
}

void draw() //runs continously until the program is stopped
{
   
    stroke(128,0,0);//sets the color of the outline of the shapes red
    
    fill(0,128,0);// sets the fill colour green for the code line below it
    rect(0,0,100,300); //draws a rectangle
    fill(0,128,0);// sets the fill colour green for the code line below it
    rect(2450,1200,100,300);// draws a rectangle
    
    fill(0);//sets the color black for the texts and shapes code lines below it
    ellipse(1280,720,50,50); //draws a circle
    textSize(50);// sets the size of the text at 50
    text("2",1100,720);//writes the text 2
    text("5",1480,720);//writes the text 5
  }

