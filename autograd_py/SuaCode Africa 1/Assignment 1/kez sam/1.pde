//maxX = 1440 , maxY = 720

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs continuously until the program is stopped
{
  background(0,0,0);  //sets the background black

   stroke(0, 0, 255); //sets the color of the outline of shapes drawn below this code below green


   fill(0, 255, 0); //sets the color of shapes drawn below this code red


   rect(0, 30, 80, 170); //draws a rectangle

   fill(0, 254, 0);//sets the color of shapes drawn below this code light blue


   ellipse(650, 350, 65, 65); //draws an ellipse


   textSize(35); //set text size to 20


   fill(255,255,255); //sets the color of text drawn below this code White

   text("0", 350, 350); //writes text on screen

   stroke(0, 0, 255); //sets the color of the outline of shapes drawn below this code below blue

    

   fill(0, 255, 0); //sets the color of shapes drawn below this code red


    rect(1370, 550, 80, 170); //draws a rectangle

    textSize(35); //set text size to 20


   fill(255,255,255); //sets the color of text drawn below this code white

   text("5", 930, 350); //writes text on screen

}
