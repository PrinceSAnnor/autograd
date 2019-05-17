//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight =1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{ 
  background(0);   //forbackground color
  
  fill(0,255,0);     //filling the paddle color
  stroke(0,255,255); //to fill the border color of the paddle
  rect(0,0,100,400); //to make the right paddle
   
  fill(255,255,255);        //filling the ball color
  stroke(0,0,255);         //to fill the border color of the vall
  ellipse(900,500,50,50); //to make the ball center and size
  
  
  fill(0,255,0);         //filling the paddle color
  stroke(0,255,255);     //to fill the border color of the paddle
  rect(1800,700,100,400);//to make the left paddle

  fill(255,255,255);     //to give whie color for the left score 
  textSize(100);         //the size of the word 
  text("0",700,500);     //the specified score and position
  
  
  fill(255,255,255);   //to give whie color for the right score
  textSize(100);       //the size of the word when is is displayed
  text("5",1050,500);  //the specified score and position
}
