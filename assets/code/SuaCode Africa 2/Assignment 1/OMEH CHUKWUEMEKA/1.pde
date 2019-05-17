//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(255); // set the background white
 
 // DRAWING THE MAIN PONG GAME INTERFACE RECTANGLE.
  stroke(128,128,128); // sets the outline color of shape below this code black
  fill(128,128,128); // set the color of shape drawn below this code black
  rect(0,0,1280,720); // draws rectangle.
  
  //DRAWING PADDLE AT TOP LEFT OF PONG GAME INTERFACE.
  stroke(0,128,0); //set the outline color of shape below this code to Dark green
  fill(0,255,0); //set the color of shape below this code to Green
  rect(0,0,50,200); //Draws rectangle representing the paddle.
  
  
  //DRAWING PADDLE BELOW RIGHT OF THE PONG GAME INTERFACE.
  stroke(0,0,255); //set outline color of shape below this code to Blue.
  fill(0,0,128); //set color of shape below this code to Dark blue.
  rect(1230,520,50,200); //Draws rectangel representing paddle 2.
  
  //DRAWING THE ELLIPSE
  stroke(255,255,255); //set the outline color of the shape below this code to White.
  fill(255,0,255); //set color of the shape below this code to Faint black.
  ellipse(640,360,50,50); //Draws the ellipse representing centre ball.
  
  
  //INDICATING TEXT SIZE.
  textSize(75); // set the text size 
  
  //WRITING TEXT IN THE PONG GAME INTERFACE.
  fill(255,255,255); //set the color of shape below this code to white.
  text('2',500,390); //set the left side of screen player score.
  
  text('6',740,390); //set the right side of screen player score.
  
}

//SHORT ESSAY OF MY EXPERIENCE 

/*From the day i registered for this program till today, the joy has been overwhelming. After going through the materials sent for 
this program, i told myself that i can do this and i will. Now, i am happy to have completed my first assignment. To me, the assignment 
was not challenging in any way. Cordinate systems has been something i understood right from high school and coding part wasn't
a challenge as am not a total novice to coding. It was full of fun. The only thing about the exercise was making out time to do it wasn't 
easy for me. The easest part to me was writing the code. The part that was confusing and needs serious understanding is picking your points in the 
cordinate system. My experience coding with a smartphone isn't that frustrating. With help of APDE app, it was fun. Thank Suacode and 
Nesera Foundation for this opportunity.*/