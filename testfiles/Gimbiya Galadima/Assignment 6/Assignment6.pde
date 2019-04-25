
void setup()
{
fullScreen();//sets window to full screen
background(0);//sets black as background
fill(0,0,128);//as interior of object
stroke(128,0,0);//set as outline of object
}
void draw()//
{
rect(0,30,width/2,height/8);//new Paddle object
rect(360,1260,width/2,height/8);//draws second Paddle
ellipse(width/4,height/2,width/8,height/16);//draws circle
;//set text to 4000
text("0:5",400,height/2);
ellipse(width/2,height/2,20,20);
ellipse(width/4,height/4,20,20);
ellipse(width/6,height/2,20,20);
ellipse(width/3,height/3,20,20);
ellipse(width/5,height/5,20,20);
}
//Move ellipse up and right
//Move rectangle horizontally