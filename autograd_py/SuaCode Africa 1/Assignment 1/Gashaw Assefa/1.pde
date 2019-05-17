//maxX =2160, maxY =1080

float screenWidth =2160; //set to your maxX
float screenHeight =1080; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{background(0); // black background
  
  stroke(255);  // stroke color white
  fill(0,200,0); // fill color green
    rect(0,0,25,200);// the first 
    rect(2135,880,25,200); // the 2nd 
  
  stroke(0); // white outline color for the circle
  fill(255); // fill color for the centeral circle 
    ellipse(1080,540,50,50); // circle coordinate and size
    color(0,255,0);
    textSize(50); // text size 50
    text("6",880,565); // the center for the y axis was 540 but to compensate for the text size offset i moved the cordinate for the text down by half of its size.
  text("2",1280,565); 

}
 
