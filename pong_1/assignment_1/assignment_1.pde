//maxX = 1920, maxY = 1080

void setup()
{
  fullScreen(); //Sets the program to run in full screen mode
}

void draw()
{
  background(0); //set background black

  stroke (0, 0, 255); //use a blue outline for all shapes

  //Draw paddles
  fill(0, 255, 0); //green fill for paddles
  rect(0, 0, 48, 216); //left paddle at top left
  rect(1872, 864, 48, 216); //right paddle at the bottom right

  //Draw ball
  fill(255); //fill circle white
  ellipse(960, 540, 50, 50); //draw circle at center

  //Draw scores on screen
  textSize(40); //size of the text
  text(0, 480, 540); //left score at the left center of the screen
  text(5, 1440, 540); //right score at right center of the screen
}
