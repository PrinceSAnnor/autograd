//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{  
  background(255,255,255);// sets the background white
  
  fill (0,255,0);// sets the background green
  
  stroke (0);// sets the outline black
  
  rect( 0,0,50,200);// draws paddle 1
  
  rect (1230,520,50,200);// draws paddle 2
  
  
  fill(0,0,255);// sets the background blue
  
  ellipse(610,350,120,120);// draws an ellipse
  
  
  fill(0); // sets the colour of the text black
  
  textSize(25); // sets text size to 25
  
  text("10", 400,350);// writes the first text
  
  text("15", 800,350);// writes the second text
  
  
   // Reading the notes were easy, they were really explanatory,relatable and easy to understand.
   //writing this program was really brain tasking but interesting. 
   //I had the problem of finding the co-ordinates for my second paddle( the bottom right) but when i went through some explanations on the class page,I was able to figure it out. 
   
  
}
