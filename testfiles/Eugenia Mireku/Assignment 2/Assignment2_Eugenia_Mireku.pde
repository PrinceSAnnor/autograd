      int leftPadX;//declare variable to hold position X of left paddle 
      int leftPadY; //declare variable to hold position Y of left paddle 
      int padWidth; //declares width of both paddles
      
      float rightPadX;//declare variable to hold position X of right paddle 
      float rightPadY;//declare variable to hold position Y of right paddle
      int padHeight; //declares height of both paddles
      
      int ballX;//declare variable to hold X position of ball
      float ballY;//declare variable to hold Y position of ball
      float diameter=30;//declare and initialise variable to hold size of ball
      
      int playerX;//declares playerX score
      float playerWidthX;//declare variable to hold width of playerX score
      int playerHeightX;//declare variable to hold height of playerX score
      
      int playerY; //declares player Y score
      float playerWidthY; //declare variable to hold width of playerY
      int playerHeightY; //declare variable to hold height of playerY
      int textSize=40;//declare and initialise variable to hold size of score
      
void setup()//runs once
 {    
      fullScreen();//sets full-screen
      
      leftPadX=0;
      leftPadY=0;
      
      rightPadX=width/1.02;
      rightPadY=height/1.2;
      
      padWidth=width/50;
      padHeight=height/6;
      
      ballX=width/2;
      ballY=height/2;
     
      playerX=3;
      playerY=2;
      
      playerWidthX=width/2.7;
      playerHeightX=height/2;
      
      playerWidthY=width/1.7;
      playerHeightY=height/2;
  }
  
 void draw()//runs forever
 {    
      background(126,126,126);//sets background grey
      stroke(125);//sets outline white
      
      fill (0);//sets ball black
      ellipse(ballX,ballY,diameter,diameter);//creates ball with variables 
      
      //Move ball down and left
      ballX--;//decrement X position 
      ballY++;//increment Y position 
      
      fill(0,255,255);//sets paddles sea blue
      rect(leftPadX,leftPadY,padWidth,padHeight);//creates left paddle with variables 
      rect(rightPadX,rightPadY,padWidth,padHeight);//creates right paddle with variables 
      
      fill(255,255,0);//sets scores yellow
      textSize(textSize);//sets scores size to 40 with variables 
      text(playerX,playerWidthX,playerHeightX);//writes player X score on screen with variables
      text(playerY,playerWidthY,playerHeightY);//writes player Y score on screen with variables 

 }
