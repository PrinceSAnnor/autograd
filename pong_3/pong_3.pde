import java.util.Collections;

//Assigment 3: Bounce ball
int gameWidth, gameHeight; 
int pLeftScore, pRightScore;
int pGameOn;
int pBallX, pBallY;
int radius;
int ballSpeedX, ballSpeedY;

ArrayList<Integer> yvalBounce = new ArrayList<Integer>();
ArrayList<Integer> xvalLeft = new ArrayList<Integer>();
ArrayList<Integer> xvalRight = new ArrayList<Integer>();

int old = 0;
int count = 0; // prevent initial errors

boolean toggle = true;

boolean once; // used to check if gameOn is true when mousePressed is true

Test test;
Code code1 = new Code();
Code code2 = new Code();
Code code3 = new Code();

void setup ()
{
  //code = new Code();
  
  ////get filename from command line for autograd
  //if (args != null) {
    
  //  File f = new File(sketchPath() + "/../" + args[0]);
  //  test = new Test(f);
  //  test.run();
    
  //} else {
  //  println("args == null");
  //}
  
  
  File f = new File(sketchPath()+"/assignment_3/assignment_3.pde");
  test = new Test(f);
  test.run();
  
  gameWidth = test.screenWidth;
  gameHeight = test.screenHeight;
  
  code1.xBall = 0.5*code1.screenWidth;
  code1.yBall = 0.5*code1.screenHeight;
  
  // Let the ball go up
  code1.ySpeed = 50;
  code2.ySpeed = 0;
  code3.ySpeed = 0;
  
  code1.xSpeed = 0;
  code2.xSpeed = code1.ySpeed;
  code3.xSpeed = code1.ySpeed;
  radius = code1.diameter()/2;
  
  mousePressed = true;
  
  //size(1920, 1080); //sets the width and height of the program  

  //background(0);

  try
  {
    //code.once();
    //code.forever();
    
    //Simulate draw()
    for(int i=0; i<45;i++){
      //code1.forever();
      //yvalBounce.add(code1.ballY());
      
      code2.forever();
      xvalLeft.add(code2.ballX());
      
      //code3.forever();
      //xvalRight.add(code2.ballX());
     }
     
     //checkWallsBounce(yvalBounce);
     
     checkLeftExit(code2);
     
     
     //checkRightExit(code3);
     //println("xvaueRight:"+xvalRight);
     
     //checkStartZero(code1);
     
     test.printResults();
  }
  catch(Exception e)
  {
    println("Code runtime error");
    test.totalScore = 0;
    test.printResults();
    exit();
  }

  
  //once = true;
  noLoop();
  exit();
  
  //redraw();//draw should run only once.
}

void settings(){
  //code.once();
}

//void draw()
//{ 
//  int time = millis();
  
//  if(time - old >= 1200){
//    //println(time);
//    toggle = false;
//  } 
  
//  pLeftScore = code.leftScore();
//  pRightScore = code.rightScore();
//  pBallX = code.ballX();
//  pBallY = code.ballY();
//  pGameOn = code.gameOn();
  
//  code.forever();
  
//  //these get the X and Y speeds of the ball
//  ballSpeedX = code.ballX() - pBallX;
//  ballSpeedY = code.ballY() - pBallY;
  
//  //I think you're checking if the ball is moving after game is on
//  //and deducting a point if gameOn is false while this happens
//  if(once) {//if gameOn is true when mousePressed
//    if(code.ballX() > pBallX) {
//      if(code.gameOn() == 0) {  
//        test.totalScore -= test.deduction;
//        println("Ball moves even if gameOn is off");
//      }
//    }
//    once = false;
//  }
  
//  //int y = code.ballY() - radius;
 
//  if(code.gameOn && toggle) {
    
//   // yval.add(code.ballY());
    
//    //println(code.ballY());
//    //println("yval:"+yval);
//  }
  
//  //checkWallsBounce();
//  //checkLeftExit();
//  //checkRightExit();
//  //checkStartZero();
//  //checkTopWall();
//  //checkBottomWall();
  
    
//  //println("ballY => " + code.ballY() + " ballSpeedY => " + ballSpeedY + " y => " + y + " ballX + ballSpeedY => " + code.ballY() + ballSpeedY);
  
//  if (time >= 1500) {
//    checkWallsBounce(yval);
    
//    test.printResults();
//    exit();
//  }
//}


void checkWallsBounce(ArrayList<Integer> yval){
    int minIndex = yval.indexOf(Collections.min(yval));
    int maxIndex = yval.indexOf(Collections.max(yval));
    
    // test upper wall bounce. 
    // If min is the first or last element it means there was no bounce.
    print(yval);
    if(minIndex == (yval.size() - 1) || minIndex == 0 ){ 
      test.totalScore -= test.deduction; // Do not go ahead to check ball will bounce below.
      return;
    }
    if ( yval.get(minIndex+1) > yval.get(minIndex) && yval.get(minIndex-1) > yval.get(minIndex)){
      count++; //Ball bounces above. Proceed to confirm for below.
    }
    
    //test lower wall bounce
    if(maxIndex == (yval.size()-1) || maxIndex == 0){
      count--; //conclude bounce code is faulty
    }
    if ( yval.get(minIndex+1) > yval.get(minIndex) && yval.get(minIndex-1) > yval.get(minIndex)){
      count++;
    }
    
    if(count < 2){
        test.totalScore -= test.deduction;
      }   
    
}

//void resetGame(){
//  if(code.gameOn == true){
//    code.gameOn = false;
//    code.xBall = code.screenWidth / 2;
//    code.yBall = code.screenHeight / 2;
//    println("Game halted");
//  }
//}

//the function checks if scores are zero at the start of the game
//we can call it at the first iteration of forever()
void checkStartZero(Code code){
  
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
void checkLeftExit(Code code) {
  
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
void checkRightExit(Code code) {
  
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
void checkTopWall(Code code) {
  
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
  //println(topWallFlag);
  //println("old:"+ballSpeedY);
  if(topWallFlag) {
    //println("new:"+ballSpeedY);
    if(ballSpeedY == -ballSpeedY) {
      //println(ballSpeedY);
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
void checkBottomWall(Code code){
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
