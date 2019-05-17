//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
    background (255);
    
    //#Pad 1#
    
  stroke(0); // set boundaries to black
  
  fill(200,0,200); //makes pads purple
   
  rect(0,0,50,180); // draws rectangles as pads
   
   //# Ball#
   stroke(0);// sets boundries of circle to black
   
   fill(0,150,0); //colors the circle green
   
   ellipse(640,320,40,40); //draws circle at the centre
   
   //#Pad 2#
     stroke(0); //sets the boundry of rectangle black
   
     fill(200,0,200);//fills rectangle with purple color
   
     rect(1230,540,50,180);//draws a rectangle
   
   //#Player 1 score#
        fill(0); //makes color of number 4 black
   
        text("4",500,350);//positions the number 4 to the right of the circle
   
        textSize(60); //increases text size to 60
   //#Player 2 score#
            fill(0); //makes color of number 0 black
   
            text("0",750,350);//positions the number 0 to the left of the circle
   
            textSize(60); //increases text sise to 60
}

//This assignment was very interesting and fun. kept me pacing up and down till i completed it. It is so exciting i could not sit.
//The lesson notes was very simple and thus very easy to understand. It felt as though it was personal discussion with someone.
//This assignment was was right on time or was exactly what i needed because it helped me prepare for an exam which includes Graphics from the python language.
