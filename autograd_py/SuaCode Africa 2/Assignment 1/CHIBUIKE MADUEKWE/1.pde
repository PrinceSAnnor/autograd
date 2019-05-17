//maxX = 960, maxY = 480

float screenWidth = 960; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup()
{
fullScreen();

  
 }
  
void draw() //runs forever

{
background(0, 255, 0);

stroke(255, 0, 0);

 fill(0, 0, 255);

stroke(255, 0, 0);
fill(0);
 rect(0 , 0, 60 , 160);

rect(960, 480, -60, -160);

stroke(255);
fill(165, 42, 42);
ellipse(480 , 240, 30, 30);

textSize(40); 
fill(0);
text("3",240,240);
text("9",760, 240);
}