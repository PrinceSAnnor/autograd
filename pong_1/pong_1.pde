//Assignment 1: Make Pong Interface
//This program grades assignment 1

void setup ()
{
  if (args != null) {
    
    File f = new File(sketchPath() + "/../" + args[0]);
    Test tests = new Test(f);
    tests.run();
    
  } else {
    println("args == null");
  }
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program
}

void draw()
{
  
}
