//maxX = 1280, maxY = 720

float screenWidth = 1280; //set to your maxX
float screenHeight = 720; //set to your maxY

void setup() //runs once
{
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{
  // Set the background color for the screen
  background(0);
  
  // Begin the left paddle codes
  // Set the interior color
  fill(0, 255, 255);
  
  // Set the color for the outlines to match the interior color
  stroke(0, 255, 255);
  
  // Create the rectangle that represents the left paddle
  rect(0, 0, 50, 200);
  
  // Begin the right paddle
  // Set the interior color to match the left paddle
  fill(0, 255, 255);
  
  // Set the color for the outlines to match the left paddle
  stroke(0, 255, 255);
  
  // Finally lets create the right paddle
  rect(1230, 520, 50, 200);
  
  // Begin the ellipse
  // Set the interior color to orange
  fill(255, 255, 0);
  
  // Set the outline color to match the interior color
  stroke(255, 255, 0);
  
  // Lets create the ellipse
  ellipse(640, 360, 50, 50);
  
  // Lets create the left player score
  // Set the interior color to white
  fill(255);
  
  // Adjust the text size
  textSize(100);
  
  // Implement the text
  text("1", 500, 400);
  
  // Lets create the right player score
  // Set the interior color to white
  fill(255);
  
  // Adjust the text size
  textSize(100);
  
  // Implement the text
  text("5", 740, 400);
}
