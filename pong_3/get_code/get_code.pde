/**********************************************************************
Creates the Code.pde class dor the student before grading the assignment
This is done here because when a sketch loads, it uses the content of the 
avaliable file.
Could have a created the Code.pde file in pong_3/Test.pde but the changes 
will only only be accessible after pong_3.pde is done grading the assignment
meaning pong_3/Test.pde will grade the stuents file, but the content of Code.pde 
will be that of the previous student. and the code for the current student 
will be written to Code.pde afer pong_3.pde is closed

I hope this makes sense. If it doesnt, just call this sketch before grading
the assignment. ill explain later
************************************************************************/

void setup() {
  //For autograd
  if (args != null) {
    
    File f = new File(sketchPath() + "/../../" + args[0]);
    GetCode getCode = new GetCode(f);
    getCode.run();
    
  } else {
    println("args == null");
  }
  
  For Teasing (Single file)
  File f = new File("C:/Users/Raymond Tetteh/Desktop/autograd/assets/code/SuaCode Africa 1/Assignment 3 - Bounce Ball/Abdulmutalab Musa/0-1TvHNd96_6UxeikeB0Vtm0fNC_rJwZ2ey-Assignment3.pde");
  GetCode getCode = new GetCode(f);
  getCode.run();
  
  noLoop();
  exit();
}
