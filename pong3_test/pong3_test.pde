//Assigment 3: Bounce ball
int gameWidth, gameHeight; 
int pLeftScore, pRightScore;
int pGameOn;
int pBallX, pBallY;
int radius;
int ballSpeedX, ballSpeedY;

boolean once; // used to check if gameOn is true when mousePressed is true

GetCode getCode;
Test test1;
Code code;;

void setup ()
{
  getCode = new GetCode();
  getCode.run();
  
  code = new Code();
  
  test1 = new Test();
  test1.run();
  
  gameWidth = test1.screenWidth;
  gameHeight = test1.screenHeight;
  
  radius = code.diameter()/2;
  
  size(1920, 1080); //sets the width and height of the program  

  background(0);

  try
  {
    code.once();
    code.forever();
  }
  catch(Exception e)
  {
    println("Code runtime error");
    test1.totalScore = 0;
    test1.printResults();
    exit();
  }
    
  if(code.leftScore() == 0  && code.rightScore() == 0)
  { 
    mousePressed = true;
  } else {
    test1.totalScore -= test1.deduction;
    println("Iniial scores not 0");
  }
  
  once = true;
}

void draw()
{
  int time = millis();
  pLeftScore = code.leftScore();
  pRightScore = code.rightScore();
  pBallX = code.ballX();
  pBallY = code.ballY();
  pGameOn = code.gameOn();
  
  code.forever();
  
  ballSpeedX = code.ballX() - pBallX;
  ballSpeedY = code.ballY() - pBallY;
  
  if(once) {
    if(code.ballX() > pBallX) {
      if(code.gameOn() == 0) {  
        test1.totalScore -= test1.deduction;
        println("Ball moves even if gameOn is off");
      }
    }
    once = false;
  }
  
  int y = code.ballY() - radius;
  //checkLeftExit();
  //checkRightExit();
  checkTopWall();
    
  //println("ballY => " + code.ballY() + " ballSpeedY => " + ballSpeedY + " y => " + y + " ballX + ballSpeedY => " + code.ballY() + ballSpeedY);
  
  
  if (time >= 60000) {
    test1.printResults();
    exit();
  }
}
  
void checkLeftExit() {
  
  boolean leftExitFlag = false;
   
  if(code.ballX() + radius <= 0)
  { 
    mousePressed = false;
    leftExitFlag = true;
  }
  
  if(leftExitFlag) {
    if(code.rightScore() - pRightScore != 1) {
      test1.totalScore -= test1.deduction;
      println("Right player should score 1 if ball exits left screen"); 
    } 
  }
}

void checkRightExit() {
  
  boolean rightExitFlag = false;
   
  if(code.ballX() - radius >= gameWidth - ballSpeedX) // dont know why balls x speed is needed but... Probably because of draw
  { 
    mousePressed = false;
    println(code.ballX() - radius + " " + gameWidth);
    rightExitFlag = true;
  }
  
  if(rightExitFlag) {
    if(code.leftScore() - pLeftScore == 1) {
      test1.totalScore -= test1.deduction;
      println("Left player should score 1 if ball exits right screen"); 
    } 
  }
}

void checkTopWall() {
  
  boolean topWallFlag = false;
   
  if((code.ballY() - radius) <= 0) // dont know why balls x speed is needed but... Probably because of draw
  { 
    if(ballSpeedY == (-1 * ballSpeedY)) {
      println("Ball hit top wall but didnt change diretion"); 
    }
  }
  
  //if(topWallFlag) {
  //  if(ballSpeedY != -1 * ballSpeedY) {
  //    println("Ball hit top wall but didnt change diretion"); 
  //  } 
  //}
}
  
