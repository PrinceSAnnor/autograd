/*==============================
     maxX = 480 && maxY = 960
=============================== */

float screenWidth = 480;
float screenHeight = 960;


void setup()
{
  //Fullscreen mode
    fullScreen();
    
  //Dark background
    background(0);
}


void draw()
{
  
  //========= Paddles ============
  //Player 1 paddle
    stroke(255, 255, 255);
    strokeWeight(3);
    fill(102, 255, 153);
    rect(5, 10, 20, 150);
  
  //Player 2 paddle
    stroke(255, 255, 255);
    strokeWeight(3);
    fill(102, 255, 153);
    rect(935, 320, 20, 150);
  
  
  //========== Ball ==============
    smooth();
    noStroke();
    stroke(255, 255, 255);
    strokeWeight(2);
    fill(255, 128, 0);
    ellipse(475, 240, 30, 30);
    
  
  //=========== Scores ===========
  //Player 1 score
    fill(255, 255, 255);
    textSize(30);
    text("3", 370, 400);
  
  //Player 2 score
    fill(255, 255, 255);
    textSize(30);
    text("2", 585, 400);
    
  
  /* Uncomment this to show players names
  
  //=========== Player Names ========
  //Player 1 
    fill(255, 255, 255);
    textSize(20);
    text("Prince", 350, 460);
    
  //Versus
    textSize(20);
    fill(255, 128, 0);
    text("vs", 480, 460);
  
  //Player 2
    textSize(20);
    fill(255, 255, 255);
    text("Bebe", 575, 460);
    
  */
  
  
}
