int pOSA;//declare 1st rectangle width&height positions 
int pOSC;//declare 2nd rectangle width position 
int pOSD;//declare 2nd rectangle height position 
int bALLX;//declare 1st&2nd rectangle width position 
int bALLY;//declare 1st&2nd rectangle height position 
int bALLZ;//declare circle position 
int bALLF;//declare circle position 
float bALLT;//declare 1st player's width position 
float bALLS;//declare 1st&2nd player's height positions 
float bALLK;//declare 2nd player's width position 
int dIAMETER=30;//declare & initialize circle's diameter 
int rADIUS=20;//declare & initialize circle's rasius
int vALUEG;//declare text size
int vALUEN=4;//declare & initialize 2nd player's score
int vALUEM=2;//declare & initialize 1st player's score
void setup() //runs once
{
  fullScreen();//sets full screen 
  background (255,0,12);// sets background 
  bALLZ=width/2;//initialize circle at center
  bALLF=height/2;//initialize circle at center
  pOSA=0;//initialize 1st rectangle width & height 
  pOSC=749;//initialize 2nd rectangle width
  pOSD=399;//initialize 2nd rectangle height
  bALLX=width/16;//initialize 1st & 2nd rectangle width
  bALLY=height/6;//initialize 1st & 2nd rectangle height 
  bALLT=width/2.3;//initialize 1st player's width position 
  bALLS=height/2;//initialize 1st& 2nd player's heights 
  bALLK=width/1.8;//initialize 2nd player's width
  vALUEG=30;//initialize the size of text
  }
  void draw ()
  {
 background(0);//sets background
 fill(128,128,2);//sets colour 
 stroke (255,0,255);//sets rectangle's outline colour 
    rect (pOSA,pOSA,bALLX,bALLY);// draws 1st rectangle 
    rect (pOSC,pOSD,bALLX,bALLY);//draws 2nd rectangle 
    fill (255,128,128);// sets circle's colour 
    stroke(255,128,128);//sets circle's outline colour 
    ellipse  (bALLZ,bALLF,dIAMETER,rADIUS);// draws circle at centre position 
    bALLF+=3;//increase ball's height 
    bALLZ-=5;//decrease ball's width
    size(vALUEG);//sets text size
    fill(255,255,255);// sets scores colour
    text(vALUEM,bALLT,bALLS);//sets 2nd player's score 
    text(vALUEN,bALLK,bALLS);//sets 1st player's score 
    }
  //After running my first code a thick circle line was drawn on the screen
  //this was rectified after setting the 2nd background and it took me a more than 5 hours to rectify it.
  //From the 1st lesson's notes if you want to write a players score you type say; text ("3")and it displays score 3 on the screen  
  //but when i want to use variables to declare the scores and i type say:text ("vALUEM") it displays vALUEM on the screen instead of say score 4 
//after taking the quotation marks away and typed: text(vALUEM) it declared 4 on the screen as expected
//Kindly explain that to me.
//Lastly,I'm finding it difficult to set my phones actual sreen size so when ever i change the sketch properties locked orientation to say portrait only one rectangle is displayed.Kindly help me fix that.