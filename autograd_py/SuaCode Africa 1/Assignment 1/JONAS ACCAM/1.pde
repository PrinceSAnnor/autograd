//maxX = 1200, maxY = 720


float screenWidth = 1200; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
     background(255); // sets the background white
    
     stroke(100,255,140);//sets the color of the outlines of the the objects
     
     fill(100,100,150);//sets the color of the paddles
     rect(0,0,75,500);//draws the rectangle at the left side 
     rect(1125,220,75,500);//draws the rectangle at the right side
    
     fill( 200,5,0);//sets the color of the circle
     ellipse(600,360,50,50);//draws the circle
    
     textSize(50);//sets the text size to 50
     text("4",100,400);//sets leftside score
     text("6",1000,400);//sets rightside score

  
}
