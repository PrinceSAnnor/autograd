/**********************************************************************
Assignment 2: Move Ball - This program grades assignment 2
It has two uses: Autograd and Single file grading, coment the one oure not using
************************************************************************/

void setup ()
{
  if (args != null) {
    
    File f = new File(sketchPath() + "/../" + args[0]);
    Test tests = new Test(f);
    tests.run();
    
  } else {
    println("args == null");
  }
  
  //File f = new File("C:\\Users\\Raymond Tetteh\\Desktop\\autograd\\assets\\code\\SuaCode Africa 1\\Assignment 2 - Move ball\\Cornelius Otchere\\0-1WA6Aigs6nFTjeKSxDtgrbxWNAaUgDOPl-Assignment2.pde");
  //Test test = new Test(f);
  //test.run();
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program 
}

void draw()
{
  
}
