/**********************************************************************
Assignment 1: Make Pong Interface - This program grades assignment 1
Has two uses Autograd and Single file, coment the one oure not using
************************************************************************/
void setup ()
{
  //For autograd
  if (args != null) {
    
    File f = new File(sketchPath() + "/../" + args[0]);
    Test tests = new Test(f);
    tests.run();
    
  } else {
    println("args == null");
  }
  
  //////For single files
  //File f = new File(sketchPath() + "/assignment_1/assignment_1.pde");
  //Test test = new Test(f);
  //test.run();
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program
}

void draw()
{
  
}
