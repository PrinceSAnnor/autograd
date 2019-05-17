//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);// set background color grey
  stroke(0,0,128);// set the color of outline of shape drawn below to blue
  fill(0,255,0);// set the color of shape drawn below green
  rect(0,0,25,100);// draw rectangle
  
  stroke(0,0,128);// set the color of outline of shape drawn below to blue
  fill(0,255,0);// set the color of shape drawn below green
  rect(1255,620,25,100);// draw rectangle
  
  stroke(0,0,128);// set the color of outline of shape drawn below to blue
  fill(255);// set the color of shape drawn below green
  ellipse(640,360,30,30);// draw circle
  
  textSize(20);// size of the text to 20
  fill(255);// set the color of text to white
  text("0",560,360);// text on screen
  
  textSize(20);// size of the text to 20
  fill(255);// set the color of text to white
  text("5",720,360);// text on screen
  }
/*this was fun😍,i'm enjoying play with code on my smartphone
it is very exciting, and i'm lookin' forward to gain more experience of
coding on smartphone.thanks💪💪*/
