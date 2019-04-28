//Assigment 3: Bounce ball

Test test1 = new Test();
Code code = new Code();
float ballX = code.get("xBall");
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
    test1.reset();
    exit();
  }
  
  println(ballX);
  mousePressed = true;
}

void draw()
{
  //if(test1.leftScore == 0  && test1.rightScore == 0)
  //{
  //  code.forever();
  //  //test1.ballX = code.xBall;
  //  println(code.xBall);
  //  if (code.xBall + code.radius > 1920) {
  //    mousePressed = false;
  //  };
  //}
}
