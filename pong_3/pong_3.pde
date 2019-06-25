import java.util.Collections;
//Assigment 3: Bounce ball

Test test;

void setup ()
{
  //get filename from command line for autograd
  if (args != null) {
    
  File f = new File(sketchPath() + "/../" + args[0]);
  test = new Test(f);
  test.run(false);
  
  } else {
    //println("args == null");
    // Use duringtrue Testing. 
    File f = new File(sketchPath()+"/assignment_3/assignment_3.pde");
    test = new Test(f);
    test.run(true);
  }
  
  

  noLoop();
  exit();
}
