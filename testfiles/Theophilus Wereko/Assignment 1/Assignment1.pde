void setup() //runs once
{
    fullScreen(); //sets fullScreen
    background(0); //set black as the backgroung color
    stroke(0,255,255);// set shape outline color to cyan
    

}

void draw() //runs forever
{
  // draw paddles as reectangle
  fill(0,255,0);  // fill the rectangular paddles with color green
  rect(0,0,width/40,height/4); // draw paddle for left player 
  rect(width,height,-width/40,-height/4); //draw paddle for right player 
  
  // draw the ball
  fill(255); // fill the ball with white color 
  ellipse(width/2,height/2, width/48,width/48); // draw the ball at the center of the screen
 
 // score counter text for players 
  textSize(30); // set the score counter text size to 30
  text("0",width/2-200,height/2); // position '0' on the left side  of the screen representing the score of the left side player 
  text("0",width/2+200,height/2); // position  '0' on the right side of the ball representing score of right side player 
  
  
}
