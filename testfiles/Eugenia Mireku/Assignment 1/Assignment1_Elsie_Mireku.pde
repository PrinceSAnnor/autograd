void setup() //runs once
{
    fullScreen(); //sets full screen
   background (126,126,126);//sets the background grey
     stroke(255,255,255);//sets the outline white

}

void draw() //runs forever
{
  fill(0,255,255);rect(0,0,width/45,height/6);//draws a rectangle 
  rect(1250,599,width/45,height/6);//draws a rectangle 
  fill (0);ellipse(width/2,height/2,width/50,height/30);//draws a circle
  textSize(60);//set text size to 60
  fill(255,255,0);text("3",550,height/1.95);//writes text on screen
  text("2",700,height/1.95);//writes text on screen 
  
}
