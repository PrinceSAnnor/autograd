class Code {
//maxX=1280 ,maxY=720

int screenWidth=1280; //set to you maxX
int screenHeight=720; //set to you maxY

//x position of the ball is exactly half of the x axis
int ballX=640; //maxX=640

//y position of the ball is exactly half of the y axis
int ballY=360; //maxY=360

int ballWidth=80;//width of ball
int ballHeight=80;//height of ball
int xSpeed=5; //ball's horizontal speed
int ySpeed=10; //ball's vertical speed
int radius=40; //since half the width or the height of the ball is the radius
int a=0;

boolean gameOn = false;

void once()
{
  fullScreen();//sets the program to run in full screen mode
  
  }
  
void forever()
  {
    background(0);
    
    stroke(255);
    
    ellipse(ballX, ballY, ballWidth ,ballHeight);
    
    //check if mouse is pressed ,set gameOn to true
    if (mousePressed) {
      gameOn = true;
      
     }
     
     //move ball
     if (gameOn) {
       ballX=ballX+xSpeed;
       ballY=ballY+ySpeed;
      }
        
        //check if ball hits left or right walls
        if((ballX-radius<0)||(ballX+radius)>screenWidth) {
          
         xSpeed=xSpeed-1;
         xSpeed=xSpeed+1;
         }
         //check if ball hits top or bottom walls
         if((ballY-radius<0)||(ballY+radius)>screenHeight){
           
           ySpeed=ySpeed*-1;//Reverse direction
          }
         }
    
    
   
int diameter()
{
return int(ballWidth);
}
int ballY()
{
return int(ballY);
}
int ballX()
{
return int(ballX);
}
int gameOn()
{
return int(gameOn);
}
}
