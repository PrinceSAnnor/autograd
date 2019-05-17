//maxX = 1920, maxY = 1080
 
void setup() //runs once 
{ 
  fullScreen(); //Sets the program to run in full screen mode    
} 
void draw() {//runs continuously until the program is stopped 
 background(0,0, 255);  //sets the background blue
  
stroke(255,0,0); 

fill(0,225,0);
 
rect(0, 0, 60, 160); //draws a rectangle
rect(1920, 1080, -60, -160);

stroke(204,102,0); //set the ellipse border color

fill(255,255,0); 

ellipse(960,540, 40,40); //draws an ellipse 

textSize(80); //set text size to 60 
 
text("3", 480,540); //writes text on screen 
text("9", 1440, 540);
}