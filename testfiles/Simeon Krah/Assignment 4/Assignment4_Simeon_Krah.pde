
int ballX; //declare variable to hold x position of ball
float ballY; //declare variable to hold y position of ball
float diameter =20; //declare and initialize position of ball
int paddleLx; //declare variable to hold x position of left paddle
int paddleLy; //declare variable to hold y position of left paddle
int paddleRx; //declare variable to hold x position of right paddle
int paddleRy; //declare variable to hold y position of right paddle
int paddleW; //declare variable to hold the width of paddles
int paddleH; //declare variable to hold the height of paddles
float numberRx; //declare variabe to hold x postion of right text
float numberRy; //declare variable to hold y position of right text
int numberLx; //declare variable to hold x postion of left text
int numberLy; //declare variable to hold y position of left text
int tSize; //declare variable to represent textsize
int ballXspeed; //declare variable to hold x postion of ball's speed
int ballYspeed; //declare variable to hold y position of ball's speed
float radius =diameter/2; //radius of the ball
boolean gameOn=false; //declare game started
int scoreR; //declare right player's score
int scoreL; //declare left player's score
boolean hasOverlappedright=false; //declares a variable
boolean hasOverlappedleft=false; //declares a variable

void setup() //runs once
{
fullScreen(); //sets full screen
ballX=width/2; //initialize x value
ballY=height/2; //initialize y value
paddleLx=width/160; //initialize x value of left paddle
paddleLy=height/170; //initialize y value of left paddle
paddleRx=width*34/35; //initialize x value of right paddle
paddleRy=height*3/4; //initialize y value of right paddle
paddleW=width/35; //position the width of paddles
paddleH=height/4; //position the height of paddles
numberRx=width*3/5; //initialize x value of right text
numberRy=height/2; //initialize y value of right text
numberLx=width*3/8; //initialize x value of left text
numberLy=height/2; //initialize y value of left text
tSize=width/25; //represent text size
ballXspeed=2; //initialize x value of ball's speed
ballYspeed=4; //initialize y value of ball's speed
scoreR=0; //initialize right score
scoreL=0; //initialize left score
}

void draw() //runs forever
{ 
fill(0,255,0); //sets interior of rectangles to green
background(0); //sets the background color to black
displayRightP(paddleRx,paddleRy, paddleW, paddleH); //draws a rectangle with variable
displayLeftP(paddleLx,paddleLy, paddleW, paddleH); //draws a second triangle with variable
hasOverlappedright=doesOverlapright(paddleRx, paddleRy, paddleW, paddleH, ballX, ballY, radius);
if(!hasOverlappedright){fill(0, 0, 255);ballXspeed=ballXspeed*-1;}
else{fill(255);}
displayBall(ballX, ballY, diameter, diameter); //calls a function to draw ball
displayLeftScore(scoreL, numberLx, numberLy); //writes text on screen with variables
displayRightScore(scoreR,numberRx, numberRy); //writes second text on screen with variables
textSize(tSize); // creates variable to set text size to 35
stroke(0,0,128); //sets the outlines of objects deep blue
movePaddle(); //calls function to move paddles
moveBall(); //calls function to move ball
checkWalls(); //calls function to check walls
setGameMode(); //calls function to set game on
//calls function to check left paddle
hasOverlappedleft=doesOverlapleft(paddleLx, paddleLy, paddleW, paddleH, ballX, ballY, radius);
if(!hasOverlappedleft){fill(0, 0, 255); ballXspeed=ballXspeed*-1;}
else{fill(255);}
}

//defines function and moves right and left paddles and constrain to make sure they do not leave screen
void movePaddle() {if(mouseX>width/2){
paddleRy=constrain(mouseY, 0, width-height+paddleW+15);}
else{paddleLy=constrain(mouseY, 0, width-height+paddleW+15);}
}

//define function to check right paddle
boolean doesOverlapright(float x, float y, float w, float h, float ballX, float ballY, float radius){
float leftEnd=ballX-radius;
float bottomEnd=ballY+radius;
float rightEnd=ballX+radius;
float topEnd=ballY-radius;
if(bottomEnd>y
&& topEnd<y+h
&& leftEnd<x+w
&& rightEnd>x){return true;} return false; } 
        
//define function to check left paddle           
boolean doesOverlapleft(float x,float y, float w, float h, float ballX, float ballY, float radius){
float leftEnd=ballX-radius;
float bottomEnd=ballY+radius;
float rightEnd=ballX+radius;
float topEnd=ballY-radius;
if(bottomEnd>y
&& topEnd<y+h
&& leftEnd<x+w
&& rightEnd>x){return true;} return false; }
          
//define paddle to show left player's score
void displayLeftScore(int scoreL, int x, int y ){fill(255); //color left score white
text(scoreL, x, y );} //draw left score

//define function to show right scores
void displayRightScore(int scoreR, float x, float y){fill(255); //color score white
text(scoreR, x, y);} //write right player's score

//define function to draw right paddle
void displayRightP(int x, int y, int w, int h){fill(0,255,0); //color paddle green
rect(x, y, w, h);} //draws right paddle 

//define function to display left paddle
void displayLeftP(int x,int y, int w, int h){fill(0,255,0); //color paddle green
rect(x, y, w, h);} //draw left paddle

//define function to display ball
void displayBall(int x, float y, float w, float h){fill(0,0,255); //color ball blue
ellipse(x, y, w,h);} //draw ball

//define function to move ball
void moveBall() {
if(gameOn){
ballX=ballX+ballXspeed; //increment x position
ballY=ballY-ballYspeed;} //increment y position
}

//define function to check walls
void checkWalls() {if((ballY-radius<0) || (ballY+radius)>height){ballYspeed=ballYspeed * -1; gameOn=true;}
//reset ball to center
if(ballX+radius<0||ballX+radius>width){ballX=width/2; ballY=height/2;}
//cause increment in scores
if(ballX+radius<=0){scoreR=scoreR+1;}
if(ballX+radius>=width){scoreL=scoreL+1;}
}

//define function to set game on
void setGameMode(){if(mousePressed){gameOn=true;}
}