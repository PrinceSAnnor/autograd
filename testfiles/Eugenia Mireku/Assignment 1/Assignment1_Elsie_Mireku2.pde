void setup() //runs once
{
    fullScreen(); //sets full screen
   background (126,126,126);//sets the background grey
     stroke(255,255,255);//sets the outline white

}

void draw() //runs forever
{
  fill(0,255,255);//sets paddles sea blue
  rect(0,0,width/50,height/6);//draws a left paddle 
  rect(width/1.02,height/1.2,width/50,height/6);//draws a right paddle 
  fill (0);//sets ball black
  ellipse(width/2,height/2,width/50,height/30);//draws a ball in the center 
  textSize(40);//set score size to 40
  fill(255,255,0);//sets scores yellow 
  text("3",width/2.5,height/2);//writes left score on screen
  text("2",width/1.7,height/2);//writes right score on screen 
  
}


