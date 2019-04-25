void setup() //runs once
{
    fullScreen(); //sets full screen
}
void draw() //runs forever
{ 
  fill(0,255,0); //sets interior of rectangles to green
  background(0); //sets the background color to black
  rect(772,358, width/30, height/4); //draws a rectangle
 rect(4,0, width/30, height/4); //draws a second triangle
 fill(0,0,255); //sets the interior of circle to blue
 ellipse(410,240, width/40, height/25); //draws a circle
 fill(255,255,255); //sets the interior of texts to white
 text("3",300, height/2); //writes text on screen
  text("7",500, height/2); //writes second text on screen
  textSize(30);// sets text size to 20
 stroke(0,0,128); //sets the outlines of objects deep blue
}

