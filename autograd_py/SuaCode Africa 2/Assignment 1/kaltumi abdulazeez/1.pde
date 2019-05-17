//maxX = 1440, maxY = 720

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{background(70, 130, 180);
  
stroke(255, 0, 0);
fill(255, 255, 0);
rect(0, 0, 60, 180);
rect(1440, 720, -60, -180);
     stroke(200); 
 fill(255, 0, 0);
 ellipse(720, 360, 30, 30);
 textSize(60); 
 fill(0);
 text("4", 360,360); 
 text("8", 1080, 360);}

