//Assigment 3: Bounce ball

void setup() {
  
  if (args != null) {
      
      File f = new File(sketchPath() + "/../../" + args[0]);
      GetCode getCode = new GetCode(f);
      getCode.run();
      
  } else {
    println("args == null"); 
  }
  
  noLoop();
  exit();
    
}

void draw()
{

}
  




  
