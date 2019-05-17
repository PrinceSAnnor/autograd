//maxX = 1024, maxY = 600

float screenWidth = 1024; //set to your maxX
float screenHeight = 600; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
   
}

void draw() //runs forever
{
   background(255);  //sets the background black
   
   stroke(0,0,0); //sets the color of the outline of shapes drawn below this code below black
   
   fill(255,255,0); //sets the color of shapes drawn below this code yellow
   rect(10,10,60,100);  //draw a rectangle (player 1)
   
   fill(255,255,0);  //sets the color of shapes drawn below this code yellow
   rect(954,490,60,100);  //draw a rectangle (player 2)
   
   fill(0,128,0);  //sets the color of shapes drawn below this code dark green
   ellipse(512,300,60,60);  //draw a ellipse (ball at center)
   
   fill(0,0,128);  //sets the color of shapes drawn below this code light blue
   textSize(35);  //set text size to 35
   text("10",390,315);  //write text on screen (score of the player 1)
   
   fill(0,0,128);  //sets the color of shapes drawn below thiq code light blue
   textSize(35);  //set text size to 35
   text("8",612,315);  //write text on screen (score of the player2)
   
   //the lesson was easy to assimilate.  I could write the codes without big problem.  but since I am not excellent in English, I had to take a little time.  nevertheless, we try for the moment
}
