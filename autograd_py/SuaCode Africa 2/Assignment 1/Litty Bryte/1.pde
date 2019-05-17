//maxX = 854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,0,0);// set background to black
  
  stroke(255,0,0);//set color of the outline of shapes drawn below this code to red
  fill(0,255,0);//set color of shapes drawn under this code to green
  
  rect(0,0,20,100); // draws a rectangle 
  rect(830,375,20,100); //draws second rectangle 
  
  fill(255,223,0);//set the color of ellipse to gold
  stroke(0,255,0);//set the outline off ellipse to green
  
  ellipse(450,240,20,20); // draws ellipse
  
  fill(255,255,255);//set text color to white
  
  textSize(30);//set text size to 30
  
  //the code below shows position of texts 
  text("8",300,240);//score of the right player
  text("3",600,240);//score of the left player
}


