//maxX = 800, maxY = 480

float screenWidth = 800; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  
background(0); //provides a black-coloured background.
  
   fill(0,255,0);
  
   rect(0,0,50,100);
  
   rect(750,380,50,100); 
   
    //the functions from fill to rect create the two paddles and their colour
   
   
   fill(255,255,255);
   
   ellipse(400,240,50,50);
     //the functions above produce the ping-pong ball
   
   
   textSize(40);
   
   text("5",250,255);
   
   text("7",550,255);
   //these codes are for the arbitrary numbers that represent the players' scores
}


//  This has been my first coding with processing and its a rather interesting experience.
// Knowing about what processing can be used for has increased my interest and curiosity
// to want to  know more. The challenges i faced was trying to clone the repository.
//  I had difficulties and i had to uninstall and install the app severally. Nonetheless,
//  it was an experience I'm glad i encountered. 
//  This first lesson was very precise and devoid of any ambiguity. 
//  It was simple to learn and the activities given in the course of study
//  helped me as it got me practising as i was reading. 
//   In all, this has been fun and i can't wait for the second lecture.
