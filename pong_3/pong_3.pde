import java.util.Collections;

//Assigment 3: Bounce ball

Test test;

void setup ()
{
  File f = new File(sketchPath()+"/assignment_3/assignment_3.pde");
  test = new Test(f);
  test.run();

  noLoop();
  exit();
}
