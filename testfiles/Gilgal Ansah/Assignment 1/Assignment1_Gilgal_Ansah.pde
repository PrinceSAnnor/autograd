void setup() //runs once
{
    fullScreen (); //sets full screen
    background(0); // sets background to black;
    stroke (0); //sets shapes outline to black
    textSize (width/25); //sets texts size to 50
    //no fill function because different shapes will have different colors
    
}

void draw() //loops until program is stopped
{
  // Drawing paddles
  fill (255,0,0); // paddle color red
  rect (0,0,width/10,height/2); //top left paddle
  rect (width-width/10, height/2, width/10,height/2); //bottom right paddle
  
  //Drawing ball
  fill (0,255,0); //ball color green
  ellipse (width/2,height/2, width/15, width/15); // ball with diameter 80
  
  //Adding text
  fill (255); //text color white
  text (0,width/2-150,height/2-10);
  text (10000,width/2+150,height/2+10);
  

}
  
  

