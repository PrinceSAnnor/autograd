//maxX = 1440, maxY = 720
//
float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background (0); //sets the background color to grey
fill(0,255,0);

rect(0,0,100,180); //draws a rectangle

fill(0,255,0);

rect(1350,550,100,180); //draws a rectangle


  fill(255,255,255);//sets color of ellipse to white

ellipse(720,360,50,50); //draws an ellipse

textSize(60);//sets the text size to 60
text("0",600,360); // writes text on screen

textSize(60);
text("5",800,360);

}


