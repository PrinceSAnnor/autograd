//Assigment 3: Bounce ball
int gameWidth, gameHeight; 
int pLeftScore, pRightScore;
int pGameOn;
int pBallX, pBallY;
int radius;
int ballSpeedX, ballSpeedY;

boolean once; // used to check if gameOn is true when mousePressed is true

Test test;
Code code;

void setup ()
{
  code = new Code();
  
  ////get filename from command line for autograd
  //if (args != null) {
    
  //  File f = new File(sketchPath() + "/../" + args[0]);
  //  test = new Test(f);
  //  test.run();
    
  //} else {
  //  println("args == null");
  //}
  
  File f = new File("C:/Users/Raymond Tetteh/Desktop/autograd/assets/code/SuaCode Africa 1/Assignment 3 - Bounce Ball/Assignment 3 - Bounce Ball/Alfred Ogada/0-1R6N4KuVXfcQZemCuRVcNNJFKEpCdK9mv-Assignment3.pde");
  test = new Test(f);
  test.run();
  
  gameWidth = test.screenWidth;
  gameHeight = test.screenHeight;
  
  radius = code.diameter()/2;
  
  //size(1920, 1080); //sets the width and height of the program  

  background(0);

  try
  {
    code.once();
    code.forever();
  }
  catch(Exception e)
  {
    println("Code runtime error");
    test.totalScore = 0;
    test.printResults();
    exit();
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
        test.totalScore -= test.deduction;
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
  
  if (time >= 20000) {
    test.printResults();
    exit();
  }
}

//the function checks if scores are zero at the start of the game
//we can call it at the first iteration of forever()
void checkStartZero(){
  
  if(once){
    try {
      //deduction
      if(code.leftScore()!=0 || code.rightScore()!=0 ){
        test.totalScore -= test.deduction;
      }
      //feedback
      if(code.leftScore()!=0){
        println("Left Player Score does not start at zero");
      }
      
      if(code.rightScore()!=0){
        println("Right Player score does not start at zero");
      }
    } catch(Exception e) {
       test.errors.add("Error: Do you have variables for scores?"); 
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
      test.totalScore -= test.deduction;
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
      test.totalScore -= test.deduction;
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
      test.totalScore -= test.deduction;
      println("Ball hit top wall but didnt change diretion"); 
      println(test.totalScore);
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
  //    test.totalScore -= test.deduction;
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
      test.totalScore -= test.deduction;
      println("Ball hit bottom wall but didnt change diretion"); 
    } 
  }
}




  
