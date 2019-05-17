//maxX=100 maxY=100
//maximum X value is 100 and maximum Y value is 100
  void setup(){
  fullScreen();   //set the display Mode to full Screen
}

  void draw(){
   background(25);   //set the background of the window to black
   stroke(255,0,0);  // set the outline color of the shapes to red
   fill(255,255,0);  //set the inferior color of the paddles to yellow 
   rect(1,1,30,40);  //initialize a paddle 
   rect(70,60,30,40);  //initialize a paddle 

    fill(255,0,255);          //set the color of the circle to purple
    ellipse(50,50,10,10);     //initialize a circle


    text(1,35,35);      //display player one as number 1
    text(2,65,55);      //display player two as number 2
    textSize(20);       //set the text size of the numbers as 20
}
