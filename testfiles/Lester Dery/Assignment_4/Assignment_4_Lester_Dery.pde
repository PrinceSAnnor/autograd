


int ballX=320; // declare variable to hold x position of ball
float ballY=180; // declare variable to hold y position of ball
float diameter=20; // declare and initiate
float radius =10; //declare variable to store radius 
int leftScore =0; // declare variable for left score
int rightScore =0; //declare variable for right score
float leftPaddleX =0; // variable for left paddle x position 
float leftPaddleY =0; // variable for left paddle y position 
float rightPaddleX =620; //variable for right paddle x position
float rightPaddleY=280; // variable for right paddle y position 
int paddleWidth =20; // variable for paddle width 
int paddleHeight=80; // variable for paddle height
int txtSize=80; // variable for text size
int leftScoreX=180; //variable for left score x position 
int leftScoreY=180; //variable for left score y position 
int rightScoreX=460; //variable for right score x position 
int rightScoreY=180; // variable for right score y position 
int speedX=3; // variable for ball speed
int speedY=2; // variable for ball speed
boolean gameOn=false; // variable for when game is off.
boolean hasOverlapped = false;


void setup() {
  size(640,360);
background(0);   // sets background to black

}


  
  void draw() {
   background(0);
   
    
    fill(0,255,0); // Green interior
    stroke(0,0,255); // blue outline

//functions to perform the tasks
displayPaddle();  
displayBall();  
displayScores();
setGameMode(); 
checkWall();
moveBall(gameOn);
movePaddles();
checkLeftPaddle();
checkRightPaddle();

}
    
    
void  movePaddles(){
   if(mouseX<height){
     leftPaddleY=constrain(mouseY,0,height-paddleHeight);//contrain left paddle to draw window.
   }
    else{
      rightPaddleY=constrain(mouseY,0,height-paddleHeight);// constrain right paddle to draw window
      }
    }
  
  
 void checkLeftPaddle(){
  //Check if there is an overlap
 hasOverlapped = doesOverlap(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, mouseX, mouseY,radius);
 

if (hasOverlapped){
  //return ball in opposite direction
  speedY=speedY*-1;
  speedX=speedX*-1;
  
}
}

void displayPaddle(){
 rect(rightPaddleX,rightPaddleY,paddleWidth, paddleHeight);  // draws second rectangle 
    rect(leftPaddleX,leftPaddleY,paddleWidth, paddleHeight); //draws rectangle 
 
}

void displayScores(){
  fill(255,255,255); // sets  text interior to white
stroke(255,255,255); // sets text colour to white
textSize(txtSize);  // sets text size
text(leftScore,leftScoreX,leftScoreY);  // sets text to 0
text(rightScore,rightScoreX,rightScoreY); // sets text to 0

  
  
  
}


void checkRightPaddle(){
  //Check if there is an overlap
 hasOverlapped = doesOverlap(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, mouseX, mouseY,radius);
 if (hasOverlapped){
  //return ball in opposite direction
  speedY=speedY*-1;
 speedX=speedX*-1;
  
}
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

void checkWall(){
  
   //Check if ball hits top and bottom walls
 if((ballY-radius<=0)||(ballY+radius)>=height){
   speedY=speedY*-1; }
 
 
 
 
  if ((ballX-radius<=0)){ // ball hits left side
   leftScore=leftScore +1; // increase left player score
   gameOn=false; // turn off game
 }
 
 if ((ballX+radius)>=width){ //ball hits right side
  rightScore=rightScore +1; // increase right player score
   gameOn=false; // turn off game 
 }
  
}

void setGameMode(){
  if(mousePressed){ // game activates if the user touches the screen 
   gameOn=true; } // game is turned on
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
