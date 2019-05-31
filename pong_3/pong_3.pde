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
Code code;

void setup ()
{
  //frameRate(4);
  
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
   
  //if I'm right, you're trying check if the Scores start at 0 
  //I'm writing a function checkStartZero() for this which we can call at the start of the test
  if(code.leftScore() == 0  && code.rightScore() == 0)
  { 
    mousePressed = true;
  } else {
    test1.totalScore -= test1.deduction;
    println("Iniial scores not 0");
  }
  
  once = true;
  //noLoop();
  //exit();
  
  redraw();//draw should run only once.
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
  
  //these get the X and Y speeds of the ball
  ballSpeedX = code.ballX() - pBallX;
  ballSpeedY = code.ballY() - pBallY;
  
  //I think you're checking if the ball is moving after game is on
  //and deducting a point if gameOn is false while this happens
  if(once) {//if gameOn is true when mousePressed
    if(code.ballX() > pBallX) {
      if(code.gameOn() == 0) {  
        test1.totalScore -= test1.deduction;
        println("Ball moves even if gameOn is off");
      }
    }
    once = false;
  }
  
  int y = code.ballY() - radius;
  checkLeftExit();
  checkRightExit();
  checkStartZero();
  checkTopWall();
  checkBottomWall();
  
    
  //println("ballY => " + code.ballY() + " ballSpeedY => " + ballSpeedY + " y => " + y + " ballX + ballSpeedY => " + code.ballY() + ballSpeedY);
  
  
  if (time >= 60000) {
    test1.printResults();
    exit();
  }
}

//the function checks if scores are zero at the start of the game
//we can call it at the first iteration of forever()
void checkStartZero(){
  
  if(once){
    //deduction
    if(code.leftScore()!=0 || code.rightScore()!=0 ){
      test1.totalScore -= test1.deduction;
    }
    //feedback
    if(code.leftScore()!=0){
      println("Left Player Score does not start at zero");
    }
    
    if(code.rightScore()!=0){
      println("Right Player score does not start at zero");
    }
  }
  
}
  
//I think you're checking whether the ball exits the left wall when it hits it
// You're checking if the the right player score increases when this happens
void checkLeftExit() {
  
  boolean leftExitFlag = false;
   
  if(code.ballX() + radius <= 0)
  { 
    mousePressed = false;
    leftExitFlag = true;
  }
 //check if right player score increases
 //deducts a point if right score doesn't increase
  if(leftExitFlag) {
    if(code.rightScore() - pRightScore != 1) {
      test1.totalScore -= test1.deduction;
      println("Right player should score 1 if ball exits left screen"); 
    } 
  }
}

//I think this function checks whether the ball exists the right wall when it hits it
//
void checkRightExit() {
  
  boolean rightExitFlag = false;
   
  if(code.ballX() - radius >= gameWidth - ballSpeedX) // dont know why balls x speed is needed but... Probably because of draw(Raymond's comment)
  { 
    mousePressed = false;
    //println(code.ballX() - radius + " " + gameWidth);
    rightExitFlag = true;
  }
  
  //checks if  left player score increases
  //deduct a point otherwise
  if(rightExitFlag) {
    if(code.leftScore() - pLeftScore == 1) {
      test1.totalScore -= test1.deduction;
      println("Left player should score 1 if ball exits right screen"); 
    } 
  }
}

//check if ball reverses when it hits the top wall
void checkTopWall() {
  
  boolean topWallFlag = false;
  //int pBallSpeedY = 0;
  //int cBallSpeedY = 0;
  
  //while(code.ballY() - radius <= 0 && ballSpeedY < 0 ) {
  //    pBallSpeedY = ballSpeedY;
  //    print(pBallSpeedY);
  //    break; 
  //}
    
  //check if ball hits the top
  if((code.ballY() - radius) <= 0) // dont know why balls x speed is needed but... Probably because of draw
  {  
    topWallFlag = true;
  }
  
  if(topWallFlag) {
    if(ballSpeedY == -ballSpeedY) {
      test1.totalScore -= test1.deduction;
      println("Ball hit top wall but didnt change diretion"); 
      println(test1.totalScore);
    }
  }
  
  //if(code.ballY() - radius > 0 && code.ballY() - radius <= gameHeight/4  && ballSpeedY > 0 ) {
  //  cBallSpeedY = ballSpeedY;
  //  cBallSpeedY *= -1;
  //  print(cBallSpeedY); 
  //  topWallFlag = true;
  //}
  
  
  //if(topWallFlag) {
  //  println(cBallSpeedY); 
  //  if(pBallSpeedY == cBallSpeedY ) {
  //    test1.totalScore -= test1.deduction;
  //    println("Ball hit top wall but didn't change diretion"); 
  //    noLoop();
  //  }
  //}
  
}

//check if ball reverses when it hits the bottom wall
void checkBottomWall(){
  boolean bottomWallFlag = false;
  
   //check if ball hits the bottom and set the flag to true
  if((code.ballY() - radius) >= gameHeight) // if the ball exceeds the bottom wall
  { 
    bottomWallFlag = true;
  }
  
  if(bottomWallFlag) {
    if(ballSpeedY != -1 * ballSpeedY) {
      test1.totalScore -= test1.deduction;
      println("Ball hit bottom wall but didnt change diretion"); 
    } 
  }
}

//void setup() {
  
//  GetCode getCode = new GetCode();
//  getCode.run();
//  noLoop();
//  exit();
//}
//void draw() {}



  
