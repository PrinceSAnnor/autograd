int paddleX, paddleY, paddleHeight,paddleWidth;
void setup (){
  fullScreen();
  background(0);
  paddleY=height/2;
  paddleHeight=height/5;
  paddleWidth=width/20;
  
}
void draw (){
  background(0);
  movePaddle();
  fill(0,0,255);
  rect(0,30,width/3,height/32);
  rect (paddleX, paddleY, paddleHeight,paddleWidth); 
  }
void movePaddle(){
    paddleX=constrain(mouseX,0,width-paddleHeight);
    paddleY=constrain(mouseY,0,width-paddleHeight);
  
}