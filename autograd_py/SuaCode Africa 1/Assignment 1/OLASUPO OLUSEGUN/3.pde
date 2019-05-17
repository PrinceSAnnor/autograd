//maxX = 1428, maxY = 720

float screenWidth = 1428; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0); // for black background
  
  fill(230,230,250); //lavender color code
  stroke(204,102,0); // seems like its a color red
  rect(0,20,20,70);
  
  rect(1400,650,20,70);
  
  
  fill(188,143,143); // rosy brown color code
  ellipse(650,310,30,30); 
  
  text("8",600,300);
  text("5",700,300);
  textSize(40);
}
