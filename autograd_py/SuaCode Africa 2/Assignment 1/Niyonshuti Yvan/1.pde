//maxX = 1280, maxY = 800

float screenWidth = 1280; //set to your maxX
float screenHeight = 800; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);//set a background of all screen 
  
fill (0,0,128);//fill color in reft and light  rectangle 
 stroke(255,255,255);// make write color around 2 paddles.
    
    rect (0,0,30,95);// draw rectangle or paddle in upper left corner 
    rect (1249,700,30,95);//draw rectangle or paddle bottom light corner side
  
fill (220,120,10);// fill color in middle screen/all functions below 
  stroke (255,255,255);//make colour around ellipse figure 
    ellipse(640,360,60,60);//draw a ball between 2 numbers 
    
textSize (45);// mesure of 7 and 8.
    
    text("8",880,385);//display 8 for x=880 y=385.
    text("7",400,365);//diplay 7 for X =400 y=365.
}
