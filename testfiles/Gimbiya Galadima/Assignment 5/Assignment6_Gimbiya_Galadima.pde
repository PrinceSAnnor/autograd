void setup()//runs once
{
fullScreen();//sets fullScreen
background(0);//sets black as background
fill(0,0,128);//as interior of object
stroke(128,0,0);//sets outline of object
}

void draw()//
{
rect(0,30,width/2,height/8);//new paddle object
rect(360,1260,width/2,height/8);//draw second paddle
ellipse(width/4,height/2,width/8,height/16);//draws circle
;//set text to 4000
text("0:5",400,height/2);
ellipse(width/2,height/2,20,20);
ellipse(width/4,height/2,20,20);
}
//Move ellipse up and right
{
//Move rectangle horizontally
}