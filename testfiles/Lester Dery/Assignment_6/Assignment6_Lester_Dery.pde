
int ballX; // declare variable to hold x position of ball
float ballY; // declare variable to hold y position of ball
float diameter=20; // declare and initiate
float radius =10; //declare variable to store radius 
int leftScore =0; // declare variable for left score
int rightScore =0; //declare variable for right score
int leftPaddleX; // variable for left paddle x position 
int leftPaddleY; // variable for left paddle y position 
int rightPaddleX; //variable for right paddle x position
int rightPaddleY; // variable for right paddle y position 
int paddleWidth; // variable for paddle width 
int paddleHeight; // variable for paddle height
int txtSize=80; // variable for text size
int leftScoreX; //variable for left score x position 
int leftScoreY; //variable for left score y position 
int rightScoreX; //variable for right score x position 
int rightScoreY;// variable for right score y position 
int speedX=3; // variable for ball speed
int speedY=2; // variable for ball speed
boolean gameOn=false; // variable for when game is off.
boolean hasOverlapped = false;
boolean lHasOverlapped = false;
boolean rHasOverlapped =false;
 
Paddle leftPaddle, rightPaddle;
Ball ball1, ball2;
Game game1;
int noOfEllipses = 5;
int[] ellipses = {3,4,7,5,8};


void setup() {
fullScreen(); 
background(0);   // sets background to black 
//noFill();
leftPaddle= new Paddle(width-width, height-height, width/50, height/3); //new leftPaddle object
rightPaddle= new Paddle(width-(width/50), height-((height/2)+(height/6)), width/50, height/3); //new rightPaddle object  
ball1 = new Ball(width/2,height/2,20);// new ball object 
ball2 = new Ball(width/4,height/4,20);// new ball2 object
game1= new Game ( (3*width)/4 , height/2,  width/4,height/2,0, 0);// new game object 

}
 

  
  void draw() {
   background(0);
   
    
    fill(0,255,0); // Green interior
    stroke(0,0,255); // blue outline
    for(int i = 0; i < noOfEllipses; i++){
    ellipse(width/ellipses[i],height/2,20,20); // creates multiple balls with the same height but different width
  }



    
    
 
 
  
  
  
  
  
  
  
  


//functions to perform the tasks
leftPaddle.display();  
rightPaddle.display();  
ball1.display(); 
ball2.display();
game1.displayScores(); 
game1.setGameMode(); 

ball1.checkWall(game1);
ball2.checkWall(game1);

ball1.move(game1);
//ball2.move(game1);
game1.movePaddles(leftPaddle,rightPaddle);
ball1.checkPaddles(leftPaddle, rightPaddle);
}
    
    






void displayBall(){
  fill(255,255,255); // sets ball colour to white
    ellipse(ballX,ballY,diameter,diameter); //create ball with variables
    
  
}

void moveBall(boolean gameOn){
//check if game is on
  if(gameOn){
 // move ball up and right 
ballX= ballX-=speedX; // increament x position
    ballY= ballY+=speedY; // decrement y position    
}else{
   //set ball to centre
   ballX=width/2;
   ballY=height/2;
 
 }

  }
  
  


  //Paddle class
class Paddle//paddle class 
{
 float x,y,w,h;// positions,width and height 
//Paddle constructor 
 Paddle(float paddleX, float paddleY,float paddleWidth,float paddleHeight) 
  {
  //initializations 
  x=paddleX;
  y=paddleY;
  w=paddleWidth;
  h=paddleHeight;
  }
  
//Displays the paddle
void display(){
 rect(x,y,w,h);  // draws second rectangle 
 }
 
   }
   
   
   
   
   
   //Ball class
   class Ball// ball class
   {
   float x,y,d;// positions and diameter
   //Ball constructor
      Ball(int ballX, float ballY,float diameter)
    {
    //initializations
    x=ballX;
    y=ballY;
    d=diameter;
    }
    //Displays ball
   void display(){
  fill(255,255,255); // sets ball colour to white
    ellipse(x,y,d,d); //create ball with variables
  } 
  
  void move(Game game){
//check if game is on
  if(gameOn){
 // move ball up and right 
x= x-=speedX; // increament x position
    y= y+=speedY; // decrement y position    
}else{
   //set ball to centre
   x=width/2;
   y=height/2;
 
 }
}


void checkWall(Game game){
  
   //Check if ball hits top and bottom walls
 if((y-radius<=0)||(y+radius)>=height){
   speedY=speedY*-1; }
 
 
  if ((x-radius<=0)){ // ball hits left side
   leftScore=leftScore +1; // increase left player score
   gameOn=false; // turn off game
 }
 
 if ((x+radius)>=width){ //ball hits right side
  rightScore=rightScore +1; // increase right player score
   gameOn=false; // turn off game 
 }
  
}


//Checks if ball overlaps paddle
boolean doesOverlap(float x, float y, float w, float h, float checkX, float checkY, float radius){
float leftEnd = checkX-radius;
float bottomEnd = checkY+radius;
float rightEnd = checkX+radius;
float topEnd = checkY-radius;

 if (bottomEnd >= y //Check if below rectangle top
   && topEnd <= y+h //Check if above rectange bottom
   && leftEnd <= x+w //Check if left of rectangle right
   && rightEnd >= x ) //Check if right of rectangle left
 {  
return true;
 }
 
return false;
}


   void  checkPaddles(Paddle leftPaddle,Paddle rightPaddle){

  //Check if there is an overlap
 lHasOverlapped = doesOverlap(leftPaddle.x, leftPaddle.y, leftPaddle.w, leftPaddle.h, mouseX, mouseY,radius);

if (lHasOverlapped){
  //return ball in opposite direction
 // speedY=speedY*-1;
  speedX=speedX*-1;
  
} 
rHasOverlapped = doesOverlap(rightPaddle.x, rightPaddle.y, rightPaddle.w, rightPaddle.h, mouseX, mouseY,radius);

if (rHasOverlapped){
  //return ball in opposite direction
//  speedY=speedY*-1;
  speedX=speedX*-1;
  
} 

}

 

}






//Game class
  class Game {
    float x1,y1,x2,y2;
    int a,b; //positions and scores
    // Game constructor 
    Game (float rightScoreX ,float rightScoreY, float leftScoreX,float leftScoreY, int rightScore,int leftScore ) {
    // initializations
    x1= rightScoreX;
    y1= rightScoreY;
    x2= leftScoreX;
    y2= leftScoreY;
    a= rightScore;
    b= leftScore;
    
        }
    // increment of leftScore
    void incrementLeftScore(){
      if ((ballX-radius<=0)){ // ball hits left side
   b++; // increase left player score
   gameOn=false; // turn off game
 }
    }
 
    
    //increment RightScore
    void incrementRightScore(){
   
 if ((ballX+radius)>=width){ //ball hits right side
  a++; // increase right player score
   gameOn=false; // turn off game 
 }

    }
  
    // displayScore
    void displayScores(){
  fill(255,255,255); // sets  text interior to white
stroke(255,255,255); // sets text colour to white
textSize(txtSize);  // sets text size
text(b,x2,y2);  // sets text to 0
text(a,x1,y1); // sets text to 0
}
  //setGameMode
 void setGameMode(){
  if(mousePressed){ // game activates if the user touches the screen 
   gameOn=true; } // game is turned on
}    
  
  void  movePaddles(Paddle leftPaddle,Paddle rightPaddle){
   if(mouseX<height){
     leftPaddle.y=constrain(mouseY,0,height-leftPaddle.h);//contrain left paddle to draw window.
   }
    else{
      rightPaddle.y=constrain(mouseY,0,height-rightPaddle.h);// constrain right paddle to draw window
      }
    }

  }