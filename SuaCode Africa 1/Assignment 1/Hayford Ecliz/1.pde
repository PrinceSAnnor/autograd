//maxX =854, maxY = 480

float screenWidth = 854; //set to your maxX
float screenHeight = 480; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{  //two paddles

    background(0, 255, 255); //sets the background sea blue
    
      stroke(0, 0, 0); //sets the color of the outline of shapes drawn below this code deep black
    
        fill(0, 0, 225); //sets the color of shapes drawn below this code light blue
    
          rect(0, 0, 45, 150); //draws a rectangle at upper right corner
    
            rect(809, 330, 45, 150); //draws a rectangle at lower left corner 
    
    
    //ball at center
    
    fill(255, 255, 255); //sets color of shapes drawn below this code white
    
      ellipse(427, 240, 40, 40); //draws an ellipse at the center
    
    
    //scores
    
    textSize(25); //set text size to 25
    
      fill(0); //sets the color of text drawn below this code black
    
        text("0",210, 240); //writes text on screen Barcelona-0
    
          text("4",640, 240); //writes text on screen Liverpool-4
          
          
          //Short Esay
          //The truth is i really enjoyed the coding i did. My friends who have laptops and have already started learning programming on their own will always tell me how fun it is doing programming.
          //I've always wanted to also have a feel of how it is and now all i can say is im excited with what i just did.
          //Actually, i read through the basic concepts on day 1 and was in a rush to finish it up but i relaxed and waited till the next day 
          //and read through it again not because i didn't get it but because i wanted to grasp everything.
          //And then i went to the assignment and finished it up. Frankly, i had one challenge and that was making the letter s of textSize a small one, and i remembered one friend saying the 
          //little mistake you make, the program won't run at all. I recognized the problem easily because i went through the intro twice with rapt attention and much concentration.
          //Thank you all.
          
          //Hayford Kojo Humade
    //8th May 2019
}