//maxX = 720 , maxY = 1440 

float screenWidth = 1440; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{background(128,0,0);//makes background red
  rect(0,0,50,200);//creates a rectangle at 0,0 with width 50 and length 200 
 stroke(0,255,0);//makes everything below this outline drawn of shapes drawn below this code below light green 
rect(1400,500,50,200);//creates a rectangle at 1400,500 with width 50 and length 200 
ellipse(width/2,height/2,50,50);//draws an ellipse 
textSize(30);//Sets text size to 30
text("My first pong game", 100,500);//write text on screen 
text("8",600,350 );//write text on left side of the screen 
text("15",800,350);//wtite text on right side of screen 
stroke(128,0,0);//makes everything in the background red


}
