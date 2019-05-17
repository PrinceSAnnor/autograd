void setup()//runs only once
{
fullScreen();//sets fullscreen
}
void draw()//runs forever
{
background(200);//sets the background grey
stroke(0,255,0);//sets the colour of the outline of shapes drawn below this code green
fill(255,0,0);//sets the colour of shapes drawn below this code red
rect(0,30,960,135);//draws a rectangle
fill(0,255,255);//sets the colour of shapes drawn below this code light blue
ellipse(480,540,50,50);//draws an ellipse
textSize(20);//sets text size to 20
fill(0);//sets the colour of text below this code black
text("0:6,",20,270);//writes text on screen
}
