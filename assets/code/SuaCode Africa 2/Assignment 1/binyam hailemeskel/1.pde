//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);
  
  //👇displays the paddle at the top left 
  
  stroke(0,0,255);   //gives the paddles a blue border
  fill(0,255,0);     //gives the paddles a green color
  rect(0,0,40,160);
  
  //👇displays the paddle at the bottom right 
  
  stroke(0,0,255);            //gives the paddles a blue border
  fill(0,255,0);              //gives the paddles a green color
  rect(1240,560,1280,720);
  
  //👇displays the ball at the center
  
  stroke(0,0,255);
  fill(255,255,255);
  ellipse(640,360,40,40);
  
  //👇displays the score results 
  
  textSize(50);
  text("0",440,360); //to the left of the ball
  text("5",840,360); //to the right of the ball
       
}

//short essay on my experience
/*
Reading through the lesson and doing the
assignment was very much fun since it is
my first time coding using a phone and i 
can quickly compile and see the result and 
also it was not as difficult since i have 
been exposed to coding(c++) previously.

One challenge i faced doing the assignment 
was trying to replicate the interface and 
position the elements to the right pixels.

another challenge i faced while coding was, 
i could not zoom in and out to my codes
on APDE.

In conclusion, it was very exciting as a 
first assignment and i hope to learn a lot 
and find more exciting stuff from the
program.

*/
