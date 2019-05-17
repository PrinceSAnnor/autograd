//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY
void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
  background(300,0,250);  //sets the background grey
  stroke (500,270,360);
  fill(25,0,300);

  rect(0,0, 500, 100); //draws a rectangle
  
  
  rect(1655,1000, 500, 100); //draws a rectangle
  
  fill(0,255,255);


  ellipse(1080, 590, 50, 50); //draws an ellipse


  textSize(40); //set text size to 40
  fill(00);


  text("5", 1000,800); //writes text on screen
  text("20", 1000,450); //writes text on screen

// So finally settling down to write this code revealed it wasnt such a difficult task afterall, looking at it for days got me scared, i felt it was a really difficult task, i took time to watch more explanatory videos on youtube and could figure out how most games must have been built using the processor language, this was fun especially using my smart phone where i could still juggle up other stuffs on my phone.
}
