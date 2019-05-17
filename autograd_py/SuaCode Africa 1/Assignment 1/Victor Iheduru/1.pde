//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
stroke(255, 0, 0);
background(0);
stroke(255, 0, 0);
fill(255, 255, 0);
rect(0, 0, 58, 150); //draws a rectangle 
rect(1220, 550, 1280, 450);
stroke(255, 0, 0);
fill(255, 255, 255);
ellipse(650, 350, 40, 40); //draws an ellipse
textSize(30);
fill(255, 0, 255);
text("3", 500, 300);
text("6", 800, 300);
}
