void setup() //runs once
{
    fullScreen(); //sets full screen
  background(255,0,255);//sets background  
  stroke (255,0,0);//sets outline to red
}

void draw() //runs forever
{
  fill (0,0,255);//sets interior of rectangle to blue
  rect (0,0,width/16,height/6);//draws rectangle
  rect (749,399,width/16,height/6);//draws rectangle
  fill (255,255,0);//sets interior of circle to yellow
  ellipse (width/2,height/2,width/30,height/20);//draws a cicle at the center
  size (30);//sets text size to 30
  fill (255,255,255);//sets score colour to white
  text ("2",350,height/2);//writes score 2 on screen
  text ("4",442,height/2);//writes score 4 on screen
  //Coding is really fun!It tests your numerical,accuracy,logic and organizational skills.It can also give you a tough time if your code doesn't run as expected.
  //whiles some parts seem to be easy, others make you revise the notes and keep you analysing every single code.
  //The challenging aspect was getting my phone's screen size.The information i got online for the specification didn't match.So i guess you know what i did?Haha.Just choosing arbitrary figures and running the code several times. It was hectic 
  //There is also the tendency to think your code will run as expected but only to realize you left something out
  //Also, I was getting information on the console that I'm missing a semicolon when i typed textsize ().Changing it to size () worked perfectly. I would appreciate it you highlight on that for me.
  //Finally,i can also write at least a single line of code 😂😂😁Thank you Suacode team
}
