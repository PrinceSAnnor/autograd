/**********************************************************************
Assignment 1: Make Pong Interface - This program grades assignment 1
It has two uses: Autograd and Single file grading, coment the one you're not using
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
  
  ////For single files
  //File f = new File("C:\\Users\\Andrew\\Downloads\\Assignment2\\Assignment2.pde");
  //Test test = new Test(f);
  //test.run();
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program
}

void draw()
{
  
}
