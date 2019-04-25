  int ballX; //declare variable to hold x position of ball
  float ballY; //declare variable to hold y position of ball
  float diameter=20; //declare and initialize position of ball
  int paddleLx; //declare variable to hold x position of left paddle
  int paddleLy; //declare variable to hold y position of left paddle
  int paddleRx; //declare variable to hold x position of right paddle
  int paddleRy; //declare variable to hold y position of right paddle
  int paddleW; //declare variable to hold the width of paddles
  int paddleH; //declare variable to hold the height of paddles
  float numberRx; //declare variabe to hold x postion of right text
  float numberRy; //declare variable to hold y position of right text
  float numberLx; //declare variable to hold x postion of left text
  float numberLy; //declare variable to hold y position of left text
  int tSize; //declare variable to represent textsize
  int ballXspeed; //declare variable to hold x postion of ball's speed
  int ballYspeed; //declare variable to hold y position of ball's speed
 
  void setup() //runs once
  {
  fullScreen(); //sets full screen
  ballX=width/2; //initialize x value
  ballY=height/2; //initialize y value
  paddleLx=width/160; //initialize x value of left paddle
  paddleLy=height/170; //initialize y value of left paddle
  paddleRx=width-24; //initialize x value of right paddle
  paddleRy=height-123; //initialize y value of right paddle
  paddleW=width/35; //position the width of paddles
  paddleH=height/4; //position the height of paddles
  numberRx=500; //initialize x value of right text
  numberRy=250; //initialize y value of right text
  numberLx=300; //initialize x value of left text
  numberLy=250; //initialize y value of left text
  tSize=35; //represent text size
  ballXspeed=1; //initialize x value of ball's speed
  ballYspeed=2; //initialize y value of ball's speed
  }
  void draw() //runs forever
  { 
  fill(0,255,0); //sets interior of rectangles to green
  background(0); //sets the background color to black
  rect(paddleRx,paddleRy, paddleW, paddleH); //draws a rectangle with variable
  rect(paddleLx,paddleLy, paddleW, paddleH); //draws a second triangle with variable
  fill(0,0,255); //sets the interior of circle to blue
  ellipse(ballX,ballY, diameter, diameter); //creates ball with variable
  ballX=ballX+ballXspeed; //increment x position
  ballY=ballY-ballYspeed; //increment y position
  fill(255,255,255); //sets the interior of texts to white
  text("3",numberLx, numberLy); //writes text on screen with variables
  text("7",numberRx, numberRy); //writes second text on screen with variables
  textSize(tSize); // creates variable to set text size to 35
  stroke(0,0,128); //sets the outlines of objects deep blue
  }
