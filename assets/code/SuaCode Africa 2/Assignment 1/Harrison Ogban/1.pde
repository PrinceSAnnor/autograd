//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255,0,255);  //
  
  stroke(255,255,0);  //sets the color of the outline of shapes drawn below this code yellow
  
  fill(0,0,255);  //sets the color of shapes drawn below this code blue
  
  stroke(255,255,0); //
  
  rect(0, 0, 15, 100);  //draws a rectangle
  
  rect(1263, 617, 15, 102);//
  
  fill(0,0,255);  //
  
  rect(0,0,15,100);  //
  
  fill(0,0,0);  //sets the color of the shapes drawn below this code black
  
  ellipse(600, 400, 40, 40);  //draws an ellipse
  
  fill(0,0,255);  //
  
  rect(0,0,15,0);  //
  
  textSize(50);  //
  
  fill(255,255,255); //
  
  textSize(50); //sets the text size to 50
  
  fill(255,255,255);  //sets the color of text drawn below this code to white
  
  text("Liverpool 4", 300, 420);  //writes text on the screen
  
  textSize(50); //
  
  fill(255,255,255); //
  
  text("0 Barcelona", 655, 420); //
   
}


