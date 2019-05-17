//maxX = ***, maxY = ***

float screenWidth = 2187; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background (50);
  
  stroke(250,40,77);//bright red color
  fill(200,30,50); // awesome red color
  rect(0,0,50,280);//the left paddle
  rect(2137,800,50,280); //the right paddle
  
  stroke(255); //to cancel the stroke of the ball
  fill(255);// white color for the ball
  ellipse(1068.5,515,50,50);//the ball
  
  fill(255);
  stroke(50);// to cancel the previous stroke
  textSize(60);
  text("55",808.5,540);//left player score
  text("12",1258.5,540);//right player score
}