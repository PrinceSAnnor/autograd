//maxX = 1920, maxY = 1080


float screenWidth = 1920, //set to your maxX

      screenHeight = 1080, //set to your maxY
      
      //rectangle parameters

      rectwidth =50,

      rectheight=200,
      
      //rectangle position

      start_point = 0, // defining starting coordinates of first rectangle
      
      //starting position of second rectangle
      
      start_point2x = screenWidth- rectwidth,

      start_point2y=  screenHeight- rectheight,

     //centre of circle

      circlecentrex= screenWidth/2, circlecentrey = screenHeight/2, circlesize =50;
  
     //player scores

int player1Score = 0, player2Score = 0; 


void setup() //runs once

{

  fullScreen(); //Sets the program to run in full screen mode

 

}


void draw() //runs forever

{

  background (0); //set background black

  //draw paddles

  fill(125,100,200); // chose some random color :)

  rect(start_point,start_point,rectwidth, rectheight  );
  rect( start_point2x, start_point2y, rectwidth, rectheight);

  //draw circle
  fill(200,200,100); // chose some random color :)

  ellipse(circlecentrex,circlecentrey,circlesize,circlesize);

  //display player scores
    
  fill(255); //fill numbers white
  textSize(50);

 text(player1Score, 880, 540);
 text(player2Score, 1020, 540);

}


/*I would have loved if we were taught variables first looking
at the bigger picture. The material was very good though
and concise.
I find the language very similar to c and c++.
it's like c/c++ with more specific libraries.
I'm glad I was able to finish without problems.
I look forward to the next lesson.*/


