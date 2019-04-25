void setup() //runs once
{
  fullScreen(); //sets full screen
 background(0);// set black as the background color
 fill(255,255,255);//set the interior of objects to gray
 textSize(30);//set the text to 30
 text("0",width/3,height/2);//writes text on the screen
 text("                 7", width/2, height/2);// writes text on the screen
 stroke (0,0,255);//set the outline of objects to be blue
 ellipse (width/2, height/2,width/40, height/30);//draws a circle
  fill(0,255,0);// set the interior of rectangle to green
 
  rect(0,30, width/64, height/4);// draws a rectangle
  

}

void draw() //runs forever
{
  rect(1400,500, width/64, height/4);// draws a rectangle
 
 rect(1400,500,width/64, height/4);// draws a rectangle
}
