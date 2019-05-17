void setup() //runs once
{
    fullScreen(); //sets full screen
    background(0);//sets background colour to black
    fill(0,255,0);//sets colour of ellipse and numbers to green
    stroke(0,0,255);//sets outline colour to blue
    textSize(50);//sets text size 
    text("0",600,height/1.9);//sets text position to left of ellipse 
    text("5",1250,height/2);//sets text position to right of ellipse 
    ellipse(width/2,height/2,100,100); 
}

void draw() //runs forever
{
  fill(255,0,0);//sets colour of paddles to Red
  stroke(0,0,255);//sets colour of outline to blue 
  rect(width/45,height/45,width/40,height/5); //sets size of paddle at top left corner 
  rect(width/1.05,height/1.3,width/40,height/5);//sets size of paddle at lower bottom corner 

}
