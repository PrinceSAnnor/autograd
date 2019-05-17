//maxX = 480, maxY = 320

float screenWidth = 480; //set to your maxX
float screenHeight = 320; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
   background(0,147,200); //Sets the background colour blue
   
   stroke(0,150,0); //Sets outline colours of shapes beyond this to green
   
   fill(100,0,255);  //adds purple colour to shapes 
   rect(0,0,25,85); //draws left paddle  shape
   
   rect(455,235,25,85); //draws right paddle 

   fill(200,200,0); //sets colour of te ball to yellow
    ellipse(240,160,35,35); //draws circle
   
  fill(0);  //sets ball text colour to black
   textSize(40);//sets text size to 40
   text("3",120,150); //draws score for right player
   text("0",340,150);  //draws score for left player
}

