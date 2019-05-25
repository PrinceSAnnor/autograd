/**********************************************************************
Assignment 2: Move Ball - This program grades assignment 2
Has two uses Autograd and Single file, coment the one oure not using
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
  
  //File f = new File("C:\\Users\\Raymond Tetteh\\Desktop\\autograd\\assets\\code\\SuaCode Africa 1\\Assignment 2 - Move ball\\purity maritim\\0-1C7lN8RUWuqIi-YzX-5lsUar6Wlj7w0TR-Assignment2[1].pde");
  //Test test = new Test(f);
  //test.run();
  
  noLoop(); // draw doesn't have to run
  exit(); // quit the program 
}

void draw()
{
  
}
