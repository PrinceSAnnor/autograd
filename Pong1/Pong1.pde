//Assignment 1: Make Pong Interface 
//This program grades assignment 1

Test test1;
//Code code;

void setup ()
{
  test1 = new Test();
  test1.run();
  
  //code = new Code();
  
  try
  {
    //code.once();
    //code.forever();
  }
  catch(Exception e)
  {
    test1.totalScore = 0;
    println("Code runtime error");
    exit();
  }
  
  test1.printResults();
}

void draw()
{

}
