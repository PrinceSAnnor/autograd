void setup() //runs once
{
    size(1440,720); //sets full screen due to my screen resolution
    background (0); 
    fill(255,255,255);
    ellipse(720,360,50,50);
    fill(0,255,0);
    textSize(50);
    text("Welcome to Pong ",580,50);
    fill(255,0,0);
    stroke(0,0,255);
    strokeWeight(10);
    strokeJoin(BEVEL);
    strokeCap(SQUARE);
    rect(0,0,60,280);
    rect(1270,350,60,280);
    fill(255,0,255);
    textSize(35);
    text(0,580,360);
    textSize(35);
    text(5,820,360);
    
    
    

}

void draw() //runs forever
{
     
     
}
