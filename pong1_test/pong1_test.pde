//Assignment 1: Make Pong Interface 
//This program creates an interface for the Pong game

Test test1 = new Test();
Code code = new Code();

void setup ()
{
  //will change size params later
  //size(1920, 1080); //sets the width and height of the program  

  background(0);
  test1 = new Test();
  test1.run();

  try
  {
    code.once();
    code.forever();
  }
  catch(Exception e)
  {
    println("Code runtime error");
    test1.totalScore = 0;
    test1.printResults();
    exit();
  }

  test1.printResults();
}

void draw()
{
  code.forever();
}
