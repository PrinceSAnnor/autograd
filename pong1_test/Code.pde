class Code {
  //maxX = ... 1920  .., maxY = 1080
  void once()
  {
    //  size(1920, 1080); //sets the width and height of the program
    background(0);
  }
  
  void forever()
  {
    stroke (0, 25, 255); //use a blue outline for all shapes
    
    //Draw paddles 
    fill(0, 255, 0);
    rect(0, 0, 48, 216); //draws a rectangle
    rect(1872, 864, 48, 216);
    
    //Draw ball
    fill(255);
    ellipse(960, 540, 50, 50); //draws a circle
    
    //write scores
    //  textSize(40); //set text size to 40
    text(0, 480, 540); //
    text(11, 1440, 540);
  }
}
