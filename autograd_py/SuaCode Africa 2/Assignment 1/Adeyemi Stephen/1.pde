//maxX = ***, maxY = ***

float screenWidth = 1920; //set to your maxX
float screenHeight = 1080; //set to your maxY

void setup() //runs once
{
  
  
  fullScreen(); //Sets the program to run in full screen mode
  
  
  
}

void draw() //runs forever
{
  
  background (0);// to give my background a black color 
  
  
  stroke (0,255,0);//to set my outline color 
  
 fill(0,0,255); //to give color to the rectangle 

  rect(0, 10, 60, 180);// to create the first triangle 
  
  rect(1858, 890, 60, 180);// to create the second triangle 
  
  
  
  
  fill(255);//color for my circle 
  
  ellipse (950,540,60,60);//to draw my circle and give its length and breath shape 
  
  
 
  
  
  textSize(50);// my text size 
  
  fill(255) ;//my text color 
  text ("0", 750,500); // my first text and it position 
  
  text ("5", 1100 ,500);//my second text and it's position 
 
  
}
