//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  background(0);  //here i set background to black

//rectangle(paddle) 1
//i filled it with blue background and drew it in top-left of screen
fill(0,0,255);
  rect(0, 0, 30, 150); 

//paddle 2
//filled it with blue and drew it in bottom-right of screen
fill(0,0,255);
  rect(1250, 570, 30, 150);

//here is the ball in center of screen
//devided both x&y by 2 to get the center
fill(250,250,250);
  ellipse(705, 360, 30, 30); 


//text score 1
fill(250,250,250);
textSize(45);
  text("0",405, 360); 

//text score 2
fill(250,250,250);
textSize(45);
  text("5",905, 360); 

/*thanks for correcting me, i was using those variables
and i edited
i am still enjoying with this.
it's my first time to code with processing,
and it is super awesome.
thanks SuaCode Africa!!!!!!!!!*/

}
