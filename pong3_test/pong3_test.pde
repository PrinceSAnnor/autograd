//Assigment 3: Bounce ball

Test test1 = new Test();
Code code = new Code();

void setup ()
{
  //will change size params later
  size(1920, 1080); //sets the width and height of the program  
  
  background(0);
  test1 = new Test();
  test1.run();
  
  code.once();
  
  code.gameOn = true;
}

void draw()
{
  code.forever();
  println(code.leftScore);
}
