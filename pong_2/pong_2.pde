//Assignment 2: Move ball
//This program should make the ball move

void setup ()
{
  if (args != null) {
    
    File f = new File(sketchPath() + "/../" + args[0]);
    Test tests = new Test(f);
    tests.run();
    
  } else {
    println("args == null");
  }
  
  //File f = new File("C:\\Users\\Raymond Tetteh\\Desktop\\autograd\\assets\\code\\SuaCode Africa 2\\Assignment 2 - Move ball\\silas kolo\\0-19_A0IIriw2JmuSulHkDm10_BGvL3SjS3-Assignment2.pde");
  //Test test = new Test(f);
  //test.run();
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program 
}

void draw()
{
  
}
