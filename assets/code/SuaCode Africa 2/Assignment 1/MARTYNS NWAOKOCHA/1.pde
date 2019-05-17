//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  float width = 50;
  float height = 200;
  
  background (0); // draw background
  
  // draw rectangles
  fill (0,256,0);
  stroke (0,0,256);
  rect (0,0, width, height);
  rect (screenWidth - width, screenHeight - height, width, height);
 
 // drawing the circle
  fill (256,256,256);
  ellipse(screenWidth/2, screenHeight/2, 50, 50);
  
  // draw texts
  textSize(30);
  fill (255);
  text ("0",screenWidth/2 - 100, screenHeight/2);
  text ("5",screenWidth/2 + 100, screenHeight/2);
  
  
  // My lesson here is that it's good to visualize the objects spatially. Since this is the beginning, I find it easy though
  // interesting. Thanks
  
}
