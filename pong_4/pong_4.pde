//Assigment 4: Move Paddles

import java.util.Collections;

//Assigment 3: Bounce ball

Test test;

void setup ()
{
  //get filename from command line for autograd
  if (args != null) {
    
  File f = new File(sketchPath() + "/../" + args[0]);
  test = new Test(f);
  test.run();
    
  } else {
  //println("args == null");
  // This will run during testing / when run without autograd 
    File f = new File(sketchPath()+"/assignment_4/assignment_4.pde");
    test = new Test(f);
    test.run();
  }
  
  

  noLoop();
  exit();
}


//int gameWidth, gameHeight; 
//int pLeftScore, pRightScore;
//int pGameOn;
//int pBallX, pBallY;
//int radius;
//int ballSpeedX, ballSpeedY;
//int time;

//boolean once; // used to check if gameOn is true when mousePressed is true

//GetCode getCode;
//Test test1;
//Code code;

//void setup ()
//{
//  getCode = new GetCode();
//  getCode.run();
  
//  code = new Code();
  
//  test1 = new Test();
//  test1.run();
  
//  gameWidth = test1.screenWidth;
//  gameHeight = test1.screenHeight;
  
//  radius = (int) code.radius;
  
//  size(1920, 1080); //sets the width and height of the program  

//  background(0);

//  try
//  {
//    code.once();
//    code.forever();
//  }
//  catch(Exception e)
//  {
//    println("Code runtime error");
//    test1.totalScore = 0;
//    test1.printResults();
//    exit();
//  }
    
//  if(code.leftScore == 0  && code.rightScore == 0)
//  { 
//    mousePressed = true;
//  } else {
//    test1.totalScore -= test1.deduction;
//    println("Iniial scores not 0");
//  }
  
//  once = true;
//}

//void draw()
//{
//  time = millis();
//  pLeftScore = code.leftScore();
//  pRightScore = code.rightScore();
//  pBallX = code.ballX();
//  pBallY = code.ballY();
//  pGameOn = code.gameOn();
  
//  code.forever();
  
//  ballSpeedX = code.ballX() - pBallX;
//  ballSpeedY = code.ballY() - pBallY;
  
//  if(once) {
//    if(code.ballX() > pBallX) {
//      if(code.gameOn() == 0) {  
//        test1.totalScore -= test1.deduction;
//        println("Ball moves even if gameOn is off");
//      }
//    }
//    once = false;
//  }
  
//  int y = code.ballY() - radius;
//  //checkLeftExit();
//  //checkRightExit();
//  checkTopWall();
//  checkMovePaddles();
//  checkCheckLeftPaddle();
//  checkCheckRightPaddle();
//  checkDisplayScores();
//  checkDisplayBall();
//  checkDisplayPaddles();
//  checkMoveBall();
//  checkCheckWall();
//  checkSetGameMode();
    
//  //println("ballY => " + code.ballY() + " ballSpeedY => " + ballSpeedY + " y => " + y + " ballX + ballSpeedY => " + code.ballY() + ballSpeedY);
  
  
//  if (time >= 60000) {
//    test1.printResults();
//    exit();
//  }
  
//}
  
//void checkLeftExit() {
  
//  boolean leftExitFlag = false;
   
//  if(code.ballX() + radius <= 0)
//  { 
//    mousePressed = false;
//    leftExitFlag = true;
//  }
  
//  if(leftExitFlag) {
//    if(code.rightScore() - pRightScore != 1) {
//      test1.totalScore -= test1.deduction;
//      println("Right player should score 1 if ball exits left screen"); 
//    } 
//  }
//}

//void checkRightExit() {
  
//  boolean rightExitFlag = false;
   
//  if(code.ballX() - radius >= gameWidth - ballSpeedX) // dont know why balls x speed is needed but... Probably because of draw
//  { 
//    mousePressed = false;
//    println(code.ballX() - radius + " " + gameWidth);
//    rightExitFlag = true;
//  }
  
//  if(rightExitFlag) {
//    if(code.leftScore() - pLeftScore == 1) {
//      test1.totalScore -= test1.deduction;
//      println("Left player should score 1 if ball exits right screen"); 
//    } 
//  }
//}

////check if ball reverses when it hits the top wall
//void checkTopWall() {
  
//  boolean topWallFlag = false;
  
//   //check if ball hits the top
//  if((code.ballY() - radius) <= 0) // dont know why balls x speed is needed but... Probably because of draw
//  { 
//    //if(ballSpeedY == (-1 * ballSpeedY)) {
//    //  println("Ball hit top wall but didnt change diretion"); 
//    //}
//    topWallFlag = true;
//  }
  
//  if(topWallFlag) {
//    if(ballSpeedY != -1 * ballSpeedY) {
//      test1.totalScore -= test1.deduction;
//      println("Ball hit top wall but didnt change diretion"); 
//    } 
//  }
//}


//void checkMovePaddles(){//this function checks if the paddles are moving
  
//  if((mouseX < code.screenWidth/2)&&(code.leftPaddleY() != constrain(mouseY, 0, code.screenHeight-code.paddleHeight))){
//     test1.totalScore -= test1.deduction;
//     println("Left paddle does not move up and down or remain in the left part of the screen");
//     println("Make sure paddle does not leave the screen");
//  }
  
//  if((mouseX > code.screenWidth/2)&&(code.rightPaddleY != constrain(mouseY, 0, code.screenHeight-code.paddleHeight))){
//     test1.totalScore -= test1.deduction;
//     println("Right paddle does not move up and down or remain in the right part of the screen");
//     println("Make sure paddle does not leave the screen");
//  }
  
//}

////Checks if ball overlaps paddle

//boolean doesOverlap(float xPaddle, float yPaddle, float widthPaddle, float heightPaddle, float xBall, float yBall, float radius) {

//  float ballLeftEdge = xBall-radius; //left edge of ball
//  float ballBottomEdge = yBall+radius; //bottom edge of ball
//  float ballRightEdge = xBall+radius; //right edge of ball
//  float ballTopEdge = yBall-radius; //top edge of ball

//  float paddleLeftEdge = xPaddle; //left edge of paddle
//  float paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
//  float paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
//  float paddleTopEdge = yPaddle; //top edge of paddle

//  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
//    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
//    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
//    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
//  {   
//    return true;
//  } else { 
//    return false;
//  }
//}

//void checkCheckLeftPaddle(){//checks if ball bounces off left paddle
//  if(doesOverlap(code.leftPaddleX(), code.leftPaddleY(), code.paddleWidth(), code.paddleHeight(), code.ballX(), code.ballY(), radius) & (ballSpeedX != code.xSpeed*-1)){
//  test1.totalScore -= test1.deduction;
//  println("Ball does not bounce when it hits left paddle");
//  }
//}

//void checkCheckRightPaddle(){//checks if ball bounces off right paddle
//  if(doesOverlap(code.rightPaddleX(), code.rightPaddleY(), code.paddleWidth(), code.paddleHeight(), code.ballX(), code.ballY(), radius) & (code.xSpeed != code.xSpeed*-1)){
//  test1.totalScore -= test1.deduction;
//  println("Ball does not bounce when it hits right paddle");
//  }
//}

//void checkDisplayScores(){ //checks if the displayScores() function exists (code from Assignment 3 would check if it works)
//  try{
//  code.displayScores();
//  }catch(Exception e){
//    test1.totalScore -= test1.deduction;
//    println("The function displayScores() doesn't exist");
//  }
  
//}

//void checkDisplayBall(){ //checks if the displayBall() function exists (code from Assignment 3 would check if it works) 
//  try{
//  code.displayBall();
//  }catch(Exception e){
//    test1.totalScore -= test1.deduction;
//    println("The function displayBall() doesn't exist");
//  }
  
//}

//void checkDisplayPaddles(){//checks if the displayPaddles() function exists (code from Assignment 3 would check if it works)
//  try{
//  code.displayPaddles();
//  }catch(Exception e){
//    test1.totalScore -= test1.deduction;
//    println("The function displayPaddles() doesn't exist");
//  }
  
//}

////checks if the moveBall function exists (code from Assignment 3 would check if it works)
//void checkMoveBall(){
//  try{
//  code.moveBall();
//  int tempX = code.ballX();
//  int tempY = code.ballY();
  
  
//  if(code.gameOn & time > 5 ){
    
//    if (code.ballX()<= tempX & code.ballY()<= tempY){
//      test1.totalScore -= test1.deduction;
//      println("Your ball is not moving");
//    }
//    else if(code.ballX()<= tempX ){
//      println("The x component of your ball is not moving");
//      test1.totalScore -= .5;
//    }
//    else if (code.ballY()<= tempY){
//      println("The y component of your ball is not moving");
//      test1.totalScore -= .5;
//    }
    
//  }
  
//  }catch(Exception e){//would throw an exception if the function doesn't exist
//    test1.totalScore -= test1.deduction;
//    println("The function moveBall() doesn't exist");
//  }
  
//}

////checks if the checkWall() function exists (code from Assignment 3 would check if it works)
//void checkCheckWall(){
//  try{
//  code.checkWall();
//  }catch(Exception e){
//    test1.totalScore -= test1.deduction;
//    println("The function checkWall() doesn't exist");
//  }
  
//}

////checks if the setGameMode() function exists (code from Assignment 3 would check if it works)
//void checkSetGameMode(){
//  try{
//  code.setGameMode();
//  }catch(Exception e){
//    test1.totalScore -= test1.deduction;
//    println("The function setGameMode() doesn't exist");
//  }
//}





                                                                                                                                                                                                           

  
