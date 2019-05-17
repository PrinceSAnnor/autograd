//maxX = 720, maxY = 650

//float screenWidth = ***; //set to your maxX
//float screenHeight = ; //set to your maxY

void setup() //runs once
{
  fullScreen();
   //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(200); //Setting a grey background for the game 
  stroke(50,200,100); // Setting an outline color 
  fill(0,155,0); // setting color for the rectangular paddles
  rect(0,0,10,300); // Rectangular Board to the left for the ping pong game
  rect(1430,400,10,800); //Rectangular Board to the right for the ping pong game
  fill(0); //Setting color for the ping pong ball 
  ellipse(700,300,100,70); // Ping pong ball for the game
  textSize(70);  // setting a visible size for each text
  //text("Game using Processing",800,400);
  text("5",400,300); 
  text("10",900,300);
 
 
  
}
