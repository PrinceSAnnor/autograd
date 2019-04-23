//maxX = ... 1920  .., maxY = 1080
void setup() //runs once
{
  size(1920, 1080); //sets the width and height of the program
  background(0); //set background black
}
void draw()
{
  fill(45, 6, 233);
  ellipse(960, 540, 50, 50); //draw circle at center
  //fill(255);
  fill(66, 227, 90);
  rect(0, 0, 48, 216); //left paddle at top left 
  //Draw paddles
  fill(66, 227, 90);

  rect(1872, 864, 48, 216); //right paddle at the bottom right
  line(960, 0, 960, 1080);

  //Draw scores on screen
  stroke (0, 25, 255); //use a blue outline for all shapes
  textSize(40); //size of the text 
  text(0, 480, 540); //left score at the left corner of the screen
  text(5, 1440, 540); //right score at right corner of the screen
}
