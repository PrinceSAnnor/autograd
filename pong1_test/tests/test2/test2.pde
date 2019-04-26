//code written by Boampong
void setup()
{
  fullScreen();//sets to full screen
  background (0);//sets black background
}

void draw()
{
  fill(0,255,0);//green colour for paddle_A and paddle_B
  rect(3,2,30,120);//Paddle_A top left corner
  rect(1200,610,30,120); //Paddle_B bottom right corner
  
  
  //the following block of codes was used as guidelines for locating our cordinates
  //stroke(0,0,255);
  //line(width/2, height/2,width, height);//ball guideline
  //line(width/2.5,height/2.2,width, height);//left score side guideline
  //line(width/1.75, height/2.1, width, height);//right score guideline
  

  fill(255,255,255);//colour white
  ellipse(width/2, height/2,30,30);//sets ball dimensions
  
  textSize(35);//sets textsize
  fill(255,0,0);//colour red for scores
  text("0", width/2.5, height/2.2);//left score
  text("0", width/1.75, height/2.15);//right score
  
 
  
}


  //text("0",

