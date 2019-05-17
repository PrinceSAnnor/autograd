//maxX = 960, maxY = 480

float screenWidth = 960; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200);//set the background grey
  
  stroke(0,0,0);//sets the color of the outline of shapes drawn below this code black
  
  fill(255,255,0);//sets the color of the shapes drawn below this code yellow
  
  ellipse(500,300,100,100);//draw an ellipse
  
  stroke(0,0,0);//sets the color of the outline of shapes drawn below this code black
  
  fill(0,0,255);//set the color of the shapes drawn below this code blue
  
  rect(0,0,50,200);//draw a rectangle
  
  stroke(0,0,0);//sets the color of the outline of shapes drawn below this code black
  
  fill(0,0,255);//set the color of the shapes drawn below this code blue
  
  rect(900,300,50,200);//draw a rectangle
  
  fill(0,0,255);//set the color of the text below this code blue
  
  textSize(50);//set the size of the text 50
  
  text("pong interface",400,100);//
  
  fill(255,0,255);//set the color of the text below this code purple
  
  textSize(20);//set the size of the text 20
  
  text("2", 300,200);//set the text as score on the game
  
  fill(255,0,255);//set the color of the text below this code purple
  
  textSize(20);//set the size of the text 20
  
  text("5", 700,200);//set the text as scire on the game
  
  
}
