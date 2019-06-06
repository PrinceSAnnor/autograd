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
 

  try
  {
  
    //Simulate draw()
    for(int i=0; i<45;i++){
      //code1.forever();
      //yvalBounce.add(code1.ballY());
      
      
      //Checks whether the scoring on the left works
      code2.forever();
      xvalLeft.add(code2.ballX());
      
      //Checks whether the bounce works
      //code3.forever();
      //xvalRight.add(code3.ballX());
     }
     
     //checkWallsBounce(yvalBounce);
    
     
     
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
