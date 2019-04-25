

int ballX=320; // declare variable to hold x position of ball
float ballY=180; // declare variable to hold y position of ball
float diameter=20; // declare and initiate
float radius =10; //declare variable to store radius 
int leftScore =0; // declare variable for left score
int rightScore =5; //declare variable for right score
int leftPaddleX =0; // variable for left paddle x position 
int leftPaddleY =0; // variable for left paddle y position 
int rightPaddleX =600; //variable for right paddle x position
int rightPaddleY=120; // variable for right paddle y position 
int paddleWidth =40; // variable for paddle width 
int paddleHeight=240; // variable for paddle height
int txtSize=80; // variable for text size
int leftScoreX=180; //variable for left score x position 
int leftScoreY=180; //variable for left score y position 
int rightScoreX=460; //variable for right score x position 
int rightScoreY=180; // variable for right score y position 
int speedX=1; // variable for ball speed
int speedY=1; // variable for ball speed
void setup() {
  size(640,360);
background(0);   // sets background to black

}


  
  void draw() {
   background(0);
   
    
    fill(0,255,0); // Green interior
    stroke(0,0,255); // blue outline
    rect(rightPaddleX,rightPaddleY,paddleWidth, paddleHeight);  // draws second rectangle 
    rect(leftPaddleX,leftPaddleY,paddleWidth, paddleHeight); //draws rectangle 
    ellipse(ballX,ballY,diameter,diameter); //create ball with variables
    fill(255,255,255); // sets  text interior to white
stroke(255,255,255); // sets text colour to white
textSize(txtSize);  // sets text size
text(leftScore,leftScoreX,leftScoreY);  // sets text to 0
text(rightScore,rightScoreX,rightScoreY); // sets text to 5
// move ball up and right
    ballX= ballX+=speedX; // increament x position
    ballY= ballY-=speedY; // decrement y position 
  
 
   
    }
  
