//maxX = ... 1920  .., maxY = 1080

void setup() //runs once
{
  size(1920, 1080); //sets the width and height of the program
  background(0);//sets background colour to black
  fill(0,255,0);//sets colour of ellipse and numbers to green
  stroke(0,0,255);//sets outline colour to blue
  textSize(50);//sets text size 
  text("0",600,540);//sets text position to left of ellipse 
  text("5",1250,540);//sets text position to right of ellipse 
  ellipse(960, 540,100,100); 
}

void draw() //runs forever
{
  fill(255,0,0);//sets colour of paddles to Red
  stroke(0,0,255);//sets colour of outline to blue 
  rect(0, 0, 48, 216); //sets of paddle at top left corner 
  rect(1872, 864, 48, 216);//sets of paddle at lower bottom corner 
}
