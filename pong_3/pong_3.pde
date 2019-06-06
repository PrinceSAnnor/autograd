import java.util.Collections;

//Assigment 3: Bounce ball
int gameWidth, gameHeight; 

int old = 0;
int count = 0; // prevent initial errors

boolean toggle = true;

boolean once; // used to check if gameOn is true when mousePressed is true

Test test;

void setup ()
{
  File f = new File(sketchPath()+"/assignment_3/assignment_3.pde");
  test = new Test(f);
  test.run();

  noLoop();
  exit();
}





//void checkRightWall(ArrayList<Integer> xval){
//  // If the ball crosses the left it will have a value larger than the screenWidth
//  int minVal = Collections.min(xval);
  
//  if( minVal < 0 ){
//    test.totalScore -= test.deduction;
//  }
//  return;
//}


//void checkWallsBounce(ArrayList<Integer> yval){
//    int minIndex = yval.indexOf(Collections.min(yval));
//    int maxIndex = yval.indexOf(Collections.max(yval));
    
//    // Test upper wall bounce.  - If min is the first or last element it means there was no bounce.
   
//    if(minIndex == (yval.size() - 1) || minIndex == 0 ){ 
//      test.totalScore -= test.deduction; // Do not go ahead to check ball will bounce below.
//      return;
//    }
//    if ( yval.get(minIndex+1) > yval.get(minIndex) && yval.get(minIndex-1) > yval.get(minIndex)){
//      count++; //Ball bounces above. Proceed to confirm for below.
//    }
    
//    //test lower wall bounce
//    if(maxIndex == (yval.size()-1) || maxIndex == 0){
//      count--; //conclude bounce code is faulty
//    }
//    if ( yval.get(minIndex+1) > yval.get(minIndex) && yval.get(minIndex-1) > yval.get(minIndex)){
//      count++;
//    }
    
//    if(count < 2){
//        test.totalScore -= test.deduction;
//      }    
//}
