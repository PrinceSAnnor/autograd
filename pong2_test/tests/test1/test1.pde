//maxX = ... 1920  .., maxY = 1080
//By Boampong Akwasi Opoku
//Assignment2 moving ball


int ballX;//holds x position of ball
int ballY;//holds y position of ball

float diameter=30;//declare and initialize various to hold size of ball
float radius= diameter/2;

int LeftPaddleX;//holds x position of left paddle
int LeftPaddleY;//holds y position of left paddle


int RightPaddleX;//holds x position of right paddle
int RightPaddleY;//holds y position of right paddle


int PaddleWidth;//defines width of paddle
int PaddleHeight;//defines height of paddle


float RplayerScoreX;//sets x position of right player's score
float RplayerScoreY;//sets y position of right player's score

float LplayerScoreX;//sets x position of left player's score
float LplayerScoreY;//sets y position of left player's score


int BallXSpeed;//sets ball’s x increasing speed
int BallYSpeed;//sets ball’s y decreasing speed

int txtSize;
void setup()
{
  size(1920, 1080);
  
  ballX=960;//sets value for ballX
  ballY=540;//sets value for ballY
 
  //assigned values to each paddle variable
  LeftPaddleX=3;
  LeftPaddleY=2;
  
  RightPaddleX=1200;
  RightPaddleY=610;
  
  PaddleWidth=30;
  PaddleHeight=120;
  
  //assigned values to each Player variable
  RplayerScoreX=1440;
  RplayerScoreY=height/2.15;
  
  LplayerScoreX=width/2.5;
  LplayerScoreY=height/2.2;
  
  txtSize = 35;
  //assigns ball speed value to BallXSpeed and BallYSpeed  respectively
  BallXSpeed = 3;
  BallYSpeed = -3;
}

void draw()
{
  background (0);//sets black background
  
  fill(0,255,0);//green colour for paddle_A and paddle_B
  rect(LeftPaddleX,LeftPaddleY,PaddleWidth,PaddleHeight);//Paddle_A top left corner
  
  rect(RightPaddleX,RightPaddleY,PaddleWidth,PaddleHeight); //Paddle_B bottom right corner
  
  
  //the following block of codes was used as guidelines for locating our cordinates
  stroke(0,0,255);
  //line(width/2, height/2,width, height);//ball guideline
  //line(width/2.5,height/2.2,width, height);//left score side guideline
  //line(width/1.75, height/2.1, width, height);//right score guideline
  

  
  
  textSize(txtSize);//sets textsize
  fill(255,0,0);//colour red for scores
  text("0", LplayerScoreX, LplayerScoreY);//left score
  text("0", RplayerScoreX, RplayerScoreY);//right score
  
  fill(255,255,255);//colour white
  ellipse(ballX, ballY,diameter, diameter);//sets ball dimensions
  //movement of ball
  ballX= ballX + BallXSpeed; //increment x position
  ballY= ballY + BallYSpeed; //decrement y position
}


  
