class Code {
//maxX = 1280, maxY = 720

float circleX= 640; //Declare variabe to hold x position of circle
float circleY= 360; //Declare variable to hold y position of ball
int circleWidth = 50;
int circleHeight = 50;
int rectHeight = 200;
int rectWidth= 50;

void once()
{

  fullScreen(); // program runs in fullscreen mode
}

void forever()
{

  background(0); // sets the background black

  stroke(255, 0, 0); // sets the colour of the outline shapes drawn below red

  fill(255, 255, 0); // sets the colour of shapes drawn below this code yellow

  rect(mouseX, mouseY, rectWidth, rectHeight); //draws a rectangle at the top left

  fill(255, 255, 0); //sets the colour of shapes drawn below this code yellow

  rect(mouseX + 1230, mouseY + 520, rectWidth, rectHeight);//draws a rectangle at the bottom right

  fill(255, 0, 0); //sets the colour of shapes drawn below this code red

  ellipse(circleX, circleY, circleWidth, circleHeight); //draws an ellipse

  fill(0, 0, 255); // sets the text colour blue

  textSize(50); //set text size to 50

  text("2", 480, 360); //writes text on the left side ofthe screen

  text("10", 760, 360); // writes text on the right side of the screen

  //move ball up and right

  circleX = circleX + 0.6;

  circleY = circleY - 0.6;
}
}
