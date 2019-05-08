//maxX = 2160, maxY = 1080

float screenWidth = 2160; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0,200,150);// this sets the background colour for the pong game
  
  stroke(250,0,0);//sets the colour of the outline of all shapes to Red
  
  //Code for Paddle
  
  fill(0,0,250);//sets the colour of the paddles
  rect(0,0,30,200);// First paddle located at the top-left of the screen
  rect(2130,900,30,200);//Second paddle located at the Bottom-right of the screen
  
  
  //code for pong
  
  fill(0);//sets the colour of the pong to black
  ellipse(1050,550,50,50);//this draws the pong to be played and positions it at the center of the screen
  textSize(100);//This sets the size of players scores displayed on the screen
  
  
  //code for player score
  fill(250,150,200);//sets the colour of the player scores
  text ("10", 870,590); //this displays the score of player 1 as 10 and positions it at the left side of the pong
  text ("5", 1100,590);//this displays the score of player two as 5 and positions it at the right side of the pong
  
  //Essay concerning assignment 
  //So far it has been a great experience majorly on the aspect of going out of the usual
  //I.e coding via a mobile phone, but it has been worth the time
  // i had few challenges mostly about locating each point to place the ball, text and paddle..
  // i observed my screen though it shows my maxX as 2160, but if i place anything above 2150 it doesnt show,thats why i used 2130 for my second paddle
  //Also i use the greycode system only for the ball, since it was majorly on black or white and used the RGB colour code for others so the platform might look colourful
  //i had to scrabble through changing sizes to get what i wanted, which i believe was part of the challenge...and it helped me ubderstand better what was taught in the lesson material
  //A very big thank you to all our facilitators and i look forward to the next class
  //thanks
}
