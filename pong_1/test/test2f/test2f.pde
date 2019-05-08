//maxX = ... 1920  .., maxY = 1080

//code written by Boampong
void setup()
{
  size(1920, 1080); //sets the width and height of the program
  background (0);//sets black background
}

void draw()
{
  stroke (0, 25, 255); //use a blue outline for all shapes
  fill(0,255,0);//green colour for paddle_A and paddle_B
  rect(3,2,30,120);//Paddle_A top left corner
  rect(1200,610,30,120); //Paddle_B bottom right corner
  
  
  //the following block of codes was used as guidelines for locating our cordinates
  //stroke(0,0,255);
  //line(width/2, height/2,width, height);//ball guideline
  //line(width/2.5,height/2.2,width, height);//left score side guideline
  //line(width/1.75, height/2.1, width, height);//right score guideline
  

  fill(255,255,255);//colour white
  ellipse(960, 540,30,30);//sets ball dimensions
  
  textSize(35);//sets textsize
  fill(255,0,0);//colour red for scores
  text("0", 480, 540);//left score
  text("0", 1440, 540);//right score
  
 
  
}


  //text("0",
