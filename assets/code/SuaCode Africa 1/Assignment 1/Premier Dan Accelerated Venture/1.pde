//maxX = 960, maxY = 480

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(230);//code for Background colour
  stroke(0,0,200);//To add outline colour to the shape to be drawn below
  fill(200,5,5);//Fill the shape to be drwan below with red
  rect(0,0,50,150);//draw a rectangular shape
  rect(910,330,50,150);//draw a rectangular shape
  
  stroke(0,0,200);//outline colour to the shape to be drawn below (blue)
  fill(100,140,0);//the colour of the shape to be drawn below.
  ellipse (480,240,40,40);// code that draws the ellipse shape
  
  textSize(45);//code for text size
  fill(0);//code for text colour (Black)
  text("3",385,250);//code for tex 3
  text("1",550,250);//code for text 1
}
