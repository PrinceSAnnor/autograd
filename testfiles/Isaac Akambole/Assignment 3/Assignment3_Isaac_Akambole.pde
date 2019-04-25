

int S,p1,p2,diameter;//declares various integer datatype  variables 
float H1,H2,ballY,paddle1Y1,paddle1Y2,paddle2Y1,paddle2Y2,ballX,paddle1X1,paddle1X2,paddle2X1,paddle2X2;//declares various float datatype  variables 
boolean shouldStart=false;
int xSpeed=10;
int ySpeed=0;
int radius=diameter/2;
void setup() //runs once
{
    S=50;//initializes text size
    p1=600;// sets x-position of "0"
    p2=1250;//sets x-position of "5"
    H1=height/1.9;//sets y-position of "0"
    H2=height/2;//sets y-position of "5"
    ballY=height/2;//sets y-position of ball
    paddle1Y1=height/45;//sets y-position of paddle1
    paddle1Y2=height/5;//sets y-position of paddle1 
    paddle2Y1=height/1.3;//sets y-position of paddle2
    paddle2Y2=height/5;//sets y-position of paddle2
    ballX=width/2;//sets x-position of ball 
    paddle1X1=width/45;//sets x-position of paddle1
    paddle1X2=width/40;//sets x-position of paddle1
    paddle2X1=width/1.05;//sets x-position of paddle2
    paddle2X2=width/40;//sets x-position of paddle2
    diameter=50;//sets diameter of ball
    fullScreen(); //sets full screen
    background(0);//sets background colour to black
    
      
  fill(255,0,0);//sets colour of paddles to Red
  //stroke(0,0,255);//sets colour of outline to blue 
  rect(paddle1X1,paddle1Y1,paddle1X2,paddle1Y2); //sets size of paddle at top left corner 
  rect(paddle2X1,paddle2Y1,paddle2X2,paddle2Y2);//sets size of paddle at lower bottom corner 
    
    
    
    
    
    
    
    
    
    
 
}

void draw() //runs forever
{
  
   fill(255);//sets colour of ellipse and numbers to green
    //stroke(255);//sets outline colour to blue
    textSize(S);//sets text size 
    text("0",p1,H1);//sets text position to left of ellipse 
    text("5",p2,H2);//sets text position to right of ellipse 
    ellipse(ballX,ballY,diameter,diameter);//sets position and size of ball 
  //ballX++;
  //ballY--;
  if(mousePressed){
    shouldStart=true;
  }
  if(shouldStart){
    ballX=ballX+xSpeed;
    ballY=ballY-ySpeed;
  }
  if((ballX-radius<0)||(ballX+radius >width)){
    xSpeed=xSpeed*-1;
    shouldStart=false;
  }
}
