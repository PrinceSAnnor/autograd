//maxX = 1480, maxY = 720

float screenWidth = 1480; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255,255,255);  //Sets background white
  
  
  stroke(0);  //sets outline of the paddle black
  
  fill(150,0,0);  //sets the interior colour wine
  
  rect(0,0,50,200);  //draws a paddle 
  
  
  
  stroke(0);  //sets outline of paddle black
  
  fill(150,0,0);  //sets interior colour wine
  
  rect(1430,520,50,200);  //draws a paddle
  
  
  
  stroke(0);  //sets outline of circle black
  
  fill(100);    //sets interior colour grey
  
  ellipse(740,360,50,50);  //draws a circle in the centre
  
  
  fill(0);         //sets colour of text black
  
  text("18",500,360);   //writes 18 at left side
  
  textSize(40);  //sets the font size of the text
  
  
  fill(0);     //sets colour of text black
  
  text("11",980,360);  //writes 11 at right side
  
  textSize(40);   //sets the font size of the text
  
}
