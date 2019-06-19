import java.awt.Robot;
import java.awt.AWTException;
import java.lang.reflect.*;
import java.lang.reflect.Method; 

class Test {

  String[] fileLines;
  ArrayList<String> linesFiltered = new ArrayList<String>(); //filtered lines ie no empty lines
  ArrayList<Integer> backgrounds = new ArrayList<Integer>(); //background lines
  ArrayList<Integer> rects = new ArrayList<Integer>(); //rect lines
  ArrayList<Integer> ellipses = new ArrayList<Integer>(); //ellipse lines
  ArrayList<Integer> texts = new ArrayList<Integer>(); //text lines
  ArrayList<Integer> lines = new ArrayList<Integer>(); //line lines
  ArrayList<Integer> fills = new ArrayList<Integer>(); //fill lines
  ArrayList<Integer> strokes = new ArrayList<Integer>(); //stroke lines

  ArrayList<Integer> variableLines = new ArrayList<Integer>(); //lines with variables
  HashMap<String, String> variablesHashMap = new HashMap<String, String>(); //Hashmap contaning variables
  ArrayList<String> varKeys = new ArrayList<String>(); //variable names

  ArrayList<String> errors = new ArrayList<String>(); //store errors
  ArrayList<String> majorError = new ArrayList<String>(); //store the ultimate error
  
  HashMap<String,String> varNamesHashMap = new HashMap<String,String>(); //Strictly for checking GameOn
  ArrayList<Integer> yvalBounce = new ArrayList<Integer>(); // Store ycoordinate states of ball 
  ArrayList<Integer> xvalLeft = new ArrayList<Integer>(); // Store x coordinate states as ball moves leftwards
  ArrayList<Integer> xvalRight = new ArrayList<Integer>(); //

  ArrayList<Integer> scoresR = new ArrayList<Integer>();
  ArrayList<Integer> scoresL = new ArrayList<Integer>();
  
  ArrayList<Integer> rightBounceVals = new ArrayList<Integer>();//Store coordinates of ball towards right paddle
  ArrayList<Integer> leftBounceVals = new ArrayList<Integer>(); // Store coordinnates of ball towards left Paddles
  
  //ArrayLists for storing paddle positions.
  ArrayList<Integer> leftPaddlePos = new ArrayList<Integer>();// Store left paddle positions
  ArrayList<Integer> rightPaddlePos = new ArrayList<Integer>();// Store left paddle positions

  
  int count = 0;  
  int totalScore = 20; // total score of the student
  float majorExceptions = 3; //deductions that generate exceptions, ie code that won't likely compile
  int gap = 5; //interval due to floating divisions
  int screenWidth, screenHeight; //height and width of screen
  float deduction = 1; //deduction for each section missed
  float commentPercentage = 0.3; //percentage error for floatation divisions
  int tabLength = 2;
  //boolean majorErrorFlag = false; // this checks if there's a major error and does not run GetCode as a result.

  File filePath;
  
    

  //Parallel templates for different scenarios
  Code code = new Code();
  Code code1 = new Code();
  Code code2 = new Code();
  Code code3 = new Code();
  Code code4 = new Code(); //Test bounce off right paddle.
  Code code5 = new Code(); //Test bounce off left paddle.
  //Two more states for checking Paddle Movement.
  Code code6 = new Code();
  Code code7 = new Code();
  
  Method[] methods;
  
  
  
  
  //Robot method to control the mouse.
  //void Robo(int x, int y) throws AWTException{
  //  Robot robot = new Robot();
  //  robot.mouseMove(x,y);
  //}
  
  
  
  Test(File f) { 
    filePath = f;
  }

  /*
  In the function below, I'm reading the file into an array of strings. Each element in the array is a line in the file
   */
  void getLines() { //reads file
    try
    {
      fileLines = loadStrings(filePath);
    }
    catch (Exception e) //IO error
    {
      errors.add("Error: couldn't load file");
      totalScore -= majorExceptions;
    }
  }


  /*
    Loops through the lines in the file and removes white lines
   Also check for at least two empty lines to assume grouped sections of code
   */
  void removeEmptyLines() { //removes empty lines
    try
    {
      int emptyLines = 0;
      for (int i = 0; i < fileLines.length; i++) {
        if (trim(fileLines[i]).length() == 0) {//if lines have no content or a null string
          emptyLines++;
        } else {
          linesFiltered.add(trim(fileLines[i]));
        }
      }

      if (emptyLines < 2) //if at least two lines are empty
      {
        errors.add("improper code grouping");
        totalScore -= deduction;
      }
    }
    catch (Exception e) //catch exception
    {
      errors.add("Error: couldn't remove empty lines in file");
      totalScore -= majorExceptions;
    }
  }

  /*
   In the function below, I'm checking the student indented properly
   I have a var called tabs that increments when it sees a {
   And decrements when iit sees a }
   if at the end tabs < 0 there's an unmatched }
   if at the end tabs > 0 there's an unmatched {
   */

  void checkTabs()
  {
    boolean tabsFlag = false;
    int tabs = 0;
    try
    {
      for (int i = 0; i < fileLines.length; i++) {
        for (int j = 0; j < tabs; j++)
        {
          if (fileLines[i].length() > tabs && fileLines[i] != null && fileLines[i].length() > 0 && match(fileLines[i], "\\}") == null && trim(fileLines[i]).length() > 0)
          {
            if (fileLines[i].charAt(j) != ' ') //wrongly under indented
            {
              tabsFlag = true;
              //errors.add(i);
            }
            if (fileLines[i].charAt(tabs) == ' ')//wrongly over indented
            {
              tabsFlag = true;
            }
          }
        }
        if (match(fileLines[i], "\\{") != null) //find {
        {
          tabs += tabLength;
        } else if (match(fileLines[i], "\\}") != null) //find }
        {
          tabs -= tabLength;
        }
      }

      if (tabs < 0) //unmatched }
      {
        errors.add("unmatched }");
        totalScore -= deduction;
      } else if (tabs != 0) //unmatched {
      {
        errors.add("unmatched {");
        totalScore -= deduction;
      }
      if (tabsFlag) //wrong indentation
      {
        errors.add("code not indented properly");
        totalScore -= deduction;
      }
    }
    catch (Exception e) //catch exception
    {
      errors.add("Error: check tabs in file");
      totalScore -= majorExceptions;
    }
  }

  /*
    checks to see if there are more two semicolons on one line. That means there are two statements on one line.
   deduct points if the size of the array returned by matchAll is greater than 1
   */
  void checkStatementsPerLine()
  {
    try
    {
      boolean statementsFlag = false;
      for (int i = 1; i < linesFiltered.size(); i++) //start from the second line to escape the comment on the first line
      {
        if (match(linesFiltered.get(i), ";") != null) //if line has matched semi colon
        {

          if (matchAll(linesFiltered.get(i), ";").length > 1)//get number of semi colon matches
          {
            if (match(linesFiltered.get(i), "^//.*$") == null && match(linesFiltered.get(i), "//") == null)//get number of semi colon matches
            {
              statementsFlag = true;
            } else {

              String[] tokens  = trim(splitTokens(linesFiltered.get(i), "//"));

              if (tokens[0] != null && matchAll(tokens[0], ";").length > 1) {
                statementsFlag = true;
              }
            }
          }
        }
      }
      if (statementsFlag)
      {
        errors.add("insufficient comments");
        totalScore -= deduction;
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check statements per line");
      totalScore -= majorExceptions;
    }
  } 

  /*
  This line parses the first comment in the line and gets the size of the screen used by the device, it just keeps splitting by tokens
   Follow the name of the variables to understand what's going on with each splitTokens
   */
  boolean getScreenSize() //gets first comment line
  {
    try
    {
      String[] splitByComma = splitTokens(linesFiltered.get(0), ","); 

      String[] splitByEqualsLeft = splitTokens(splitByComma[0], "=");
      String[] splitByEqualsRight = splitTokens(splitByComma[splitByComma.length - 1], "=");

      String[] splitBySpacesLeft = splitTokens(splitByEqualsLeft[1]);
      String[] splitBySpacesRight = splitTokens(splitByEqualsRight[1]);

      //get width
      int i = 0;
      while (!(isNumeric(splitBySpacesLeft[i])) && i < splitBySpacesLeft.length) //parse for numeric value
      {
        i++;
      }

      screenWidth = int(trim(splitBySpacesLeft[i]));//get screen height

      if (i == (splitBySpacesLeft.length - 1) && i != 0) //if invalid width, quit program and give zero
      {
        errors.add("check width in code");
        //majorError.add("Major Error: check width in first line of code. Replace the *** with your maxX value and resubmit for grading.");
        //totalScore = 0;
        //majorErrorFlag = true;
      }

      //get height
      i = 0;
      while (!(isNumeric(splitBySpacesRight[i])) && i < splitBySpacesRight.length) //parse for numeric value
      {
        i++;
      }

      if (i == (splitBySpacesRight.length - 1) && i != 0) //if invalid height, quit program and give zero
      {
        errors.add("check height in code.");
        //majorError.add("Major Error: check height in first line of code. Replace the *** with your maxY value and resubmit for grading.");
        //totalScore = 0;
        //majorErrorFlag = true;
      }

      screenHeight = int(trim(splitBySpacesRight[i])); //get screen height
      return true;
    } 
    catch (Exception e)
    {
      errors.add("Error: check syntax of width and height at first line of code");
      majorError.add("Major Error: check syntax of width and height at first line of code. Replace the ** with your maxX and maXY values and resubmit for grading.");
      //totalScore = 0;
      //majorErrorFlag = true;
      return false;
    }
  }

  /*
  Counts the number of comments, finds the percentage of comments within the file
   */
  void checkComments() //check number of comments
  {
    try
    {
      int comments = 0;
      for (int i = 1; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "//") != null)//look for comments with regex
        {
          comments++;
        }
      }
      if (float(comments)/linesFiltered.size() < commentPercentage) //check comment percentage
      {
        errors.add("insufficient comments");
        totalScore -= deduction;
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check comments");
      totalScore -= majorExceptions;
    }
  }

  /*
  It just checks the number of strokes in the file and makes sure all the arguments are the same
   Follow the name of the variables to understand what's going on with each splitTokens
   */
  void checkStrokes() //check strokes
  {
    try
    {
      String[] splitByLeftBrace;
      String[] splitByCommas;
      ArrayList<Integer> parameters = new ArrayList<Integer>();
      boolean wrongFlag = false;
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^stroke.*$") != null)//look for stroke( or stroke ( with regex
        {
          strokes.add(i);
        }
      }

      if (strokes.size() == 0) //if no stroke
      {
        totalScore -= deduction;
        errors.add("use at least one stroke function");
      } 
      else { //stroke exists 

        splitByLeftBrace = splitTokens(linesFiltered.get(strokes.get(0)), "(");
        splitByCommas = splitTokens(splitByLeftBrace[1], ",)");
  
        int j = 0;
  
        while (isNumeric(trim(splitByCommas[j])) && j < splitByCommas.length) //get parameters
        {
          parameters.add(int(trim(splitByCommas[j])));
          j++;
        }
        int parameterSize = 0;
        parameterSize = parameters.size();
        parameters.clear();
        for (int m = 0; m < strokes.size(); m++) {
          splitByLeftBrace = splitTokens(linesFiltered.get(strokes.get(m)), "(");
          splitByCommas = splitTokens(splitByLeftBrace[1], ",)");
  
          j = 0;
          while (isNumeric(trim(splitByCommas[j])) && j < splitByCommas.length) //get parameters
          {
            parameters.add(int(trim(splitByCommas[j])));
            j++;
          }
        }
  
        
        if (parameterSize == 1 && strokes.size() > 1) //compares the parameters in the subsequent stroke functions
        {
          for (int m = 0; m < strokes.size() - 1; m++) {
            if (int(parameters.get(m)) != int(parameters.get(m+1)))
            {
              wrongFlag = true;
            }
          }
        } else if (parameterSize == 3 && strokes.size() > 1) //compares the parameters in the subsequent stroke functions
        {
          for (int m = 0; m < ((3 * (strokes.size())) - 3); m++) {
            if (int(parameters.get(m)) != int(parameters.get(m+3)))
            {
              wrongFlag = true;
            }
          }
        }
  
        if (wrongFlag)
        {
          totalScore -= deduction;
          errors.add("shapes have different outline colors");
        }
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: Check strokes function");
      totalScore -= majorExceptions;
    }
  }

  /*
  gets the parameters of the rects into an array
   Follow the name of the variables to understand what's going on with each splitTokens
   */

  void checkRects() //check rects
  {
    try
    {
      ArrayList<Integer> parameters = new ArrayList<Integer>();     
      String[] splitByLeftBrace1;
      String[] splitByCommas1;
      int max = 0;      
      int coordinateFlag = 0;
      
      //int recCounter = 0;//parameter to check if two rectangles (paddles) are used.
      for (int i = 0; i < linesFiltered.size(); i++) 
      {
        if (match(linesFiltered.get(i), "^rect.*$") != null) //look for rect( or rect ( with regex 
        {
          rects.add(i);
          //recCounter++;
        }
      }
      
      //check if rects are used and break code otherwise.
      //if(recCounter < 2){   
      //  //println("Student did not create a paddle or both paddles.");
      //  if(recCounter == 0){
      //    majorError.add("Major Error: You did not create both paddles. Do so and resubmit for grading.");
      //    totalScore = 0;
      //    //println("Student did not create both paddles");
      //  }else if(recCounter == 1){
      //    majorError.add("Major Error: You did not create one of the paddes. Do so and resubmit for grading.");
      //    totalScore = 0;
      //    //println("Student only created one paddle.");
      //  }
        
      //}

      int j = 0;
      for (int m = 0; m < rects.size(); m++) {
        splitByLeftBrace1 = splitTokens(linesFiltered.get(rects.get(m)), "(");
        splitByCommas1 = trim(splitTokens(splitByLeftBrace1[1], ",)"));

        j = 0;
        boolean magicFlag = false;
        int whichRect = 0;
        while (j < splitByCommas1.length && j < 4) //get parameters
        {  
          //gets values all parameters(variables) for both rects
          if (variablesHashMap.containsKey(splitByCommas1[j]))
          {
            parameters.add(int(variablesHashMap.get(splitByCommas1[j])));
          } else {
            parameters.add(int(splitByCommas1[j]));
          }


          if (isNumeric(splitByCommas1[j])) // check for magic numbers
          { 
            magicFlag = true;
            whichRect = m+1;
          }

          // check for expressions as params
          String[] param = splitTokens(splitByCommas1[j], " ");

          if (param.length > 1) {
            magicFlag = true;
            whichRect = m+1;
          }

          j++;
        }

        if (magicFlag) {
          errors.add("use of magic numbers as parameters for rect " + whichRect ); // 'm + 1' indicates the affected rect or paddle
          totalScore -= deduction;
        }
        max = max + j;
      }
      
      if (int(parameters.get(0)) == 0 && int(parameters.get(1)) == 0) //check which paddle is at left
      {
        coordinateFlag = 1;
      } else if (int(parameters.get(4)) == 0 && int(parameters.get(5)) == 0)
      {
        coordinateFlag = 2;
      } else //pinalize if none are at left position
      {
        totalScore -= deduction;
        errors.add("left paddle not at 0,0");
      }
      if (coordinateFlag == 1 || coordinateFlag == 0) //check second paddle
      {
        if (int(parameters.get(4)) != int(screenWidth-parameters.get(2)) || int(parameters.get(5)) != int(screenHeight-parameters.get(3))) //pinalize if wrong right paddle
        {
          totalScore -= deduction;
          errors.add("right paddle not at right bottom position");
        }
      } else if (coordinateFlag == 2 || coordinateFlag == 0) //check second paddle
      {
        if (int(parameters.get(0)) != int(screenWidth-parameters.get(6)) || int(parameters.get(1)) != int(screenHeight-parameters.get(7))) //pinalize if wrong right paddle
        {
          totalScore -= deduction;
          errors.add("right paddle not at right bottom position");
        }
      }

      if (int(parameters.get(2)) != int(parameters.get(6)) || int(parameters.get(3)) != int(parameters.get(7))) //check paddle dimensions
      {
        totalScore -= deduction;
        errors.add("paddles don't have the same dimensions");
      }

      if (parameters.size() > 8) //if more than two paddles
      {
        totalScore -= deduction;
        errors.add("you have more than two paddles? Use only two rectangles before grade is released");
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check rects");
      totalScore -= majorExceptions;
    }
  }


  /*
  It checks the color interactions between the various shapes
   Very long function and doing a number of things
   1. Two rects should have the same color
   2. Rects and shapes should have different colors
   3. Shapes and background have different colors
   Follow the name of the variables to understand what's going on with each splitTokens
   */

  /*
   This funciton assumes that if the parameter count for fill/stroke are different then the colors have to be different
   This is not necessarily the case as fill(0) = fill(0,0,0) and fill(255) = fill(255,255,255) 
   but I don't expect the students to go to that length to try and beat the system, I mean, at what cost??
   */

  void shapeColorInteractions()
  {
    try
    {
      ArrayList<Integer> rect2FillParameters = new ArrayList<Integer>();
      ArrayList<Integer> rect1FillParameters = new ArrayList<Integer>();
      ArrayList<Integer> fillParameters = new ArrayList<Integer>();
      ArrayList<Integer> backgroundParameters = new ArrayList<Integer>();
      ArrayList<Integer> ellipseFillParameters = new ArrayList<Integer>();
      String[] splitByLeftBrace1;
      String[] splitByCommas1;
      String[] splitByLeftBrace2;
      String[] splitByCommas2;
      String[] splitByLeftBrace3;
      String[] splitByCommas3;
      String[] splitByLeftBrace;
      String[] splitByCommas;
      boolean closestFlag = false;
      int closest1 = 0; //checks for the closest fill for the first paddle
      int closest2 = 0; //checks for the closest fill ot the second paddle
      int closest = 0; //checking the closest fill for the ellipse
      int n = 0;
      int k = 0;
      int j = 0;
      int cl1_index = -1;
      int cl2_index = -1;
      int cl_index = -1;

      for (int i = 0; i < fills.size(); i++) //get closest fill to paddle1
      {
        if (fills.get(i) < rects.get(0))
        {
          closest1 = fills.get(i);
          cl1_index = i;
        }
      }

      if (closest1 == 0)//if closest fill to paddle 1 exists
      {
        for (int i = fills.size(); i > 0; i--) //get closest fill to paddle1
        {
          if (fills.get(i-1) > rects.get(0))
          {
            closest1 = fills.get(i-1);
            cl1_index = i-1;
            break;
          }
        }
      }

      for (int i = 0; i < fills.size(); i++) //get closest fill to paddle2
      {
        if (fills.get(i) < rects.get(1))
        {
          closest2 = fills.get(i);
          cl2_index = i;
        }
      }

      if (closest2 == 0)//if closest fill to paddle2 exists
      {
        for (int i = fills.size(); i > 0; i--) //get closest fill to paddle2
        {
          if (fills.get(i-1) > rects.get(1))
          {
            closest2 = fills.get(i-1);
            cl2_index = i-1;
            break;
          }
        }
      }

      for (int i = 0; i < fills.size(); i++) //get closest fill to ellipse
      {
        if (fills.get(i) < ellipses.get(0))
        {
          closest = fills.get(i);
          cl_index = i;
        }
      }

      if (closest == 0) //if closest fill to ellipse exists
      {
        for (int i = fills.size(); i > 0; i--) //get closest fill to ellipse
        {
          if (fills.get(i-1) > ellipses.get(0))
          {
            closest = fills.get(i-1);
            cl_index = i-1;
            break;
          }
        }
      }

      splitByLeftBrace3 = splitTokens(linesFiltered.get(backgrounds.get(0)), "(");
      splitByCommas3 = splitTokens(splitByLeftBrace3[1], ",)");

      while (isNumeric(trim(splitByCommas3[n])) && n < splitByCommas3.length) //get background's parameters
      {
        backgroundParameters.add(int(trim(splitByCommas3[n])));
        n++;
      }

      /*This section is for the color interactions between paddles and with backgrounds */

      if (closest1 != 0 && closest2 != 0) //if there're two fills beside both paddles
      {
        splitByLeftBrace1 = splitTokens(linesFiltered.get(fills.get(cl1_index)), "(");
        splitByCommas1 = splitTokens(splitByLeftBrace1[1], ",)");
        splitByLeftBrace2 = splitTokens(linesFiltered.get(fills.get(cl2_index)), "(");
        splitByCommas2 = splitTokens(splitByLeftBrace2[1], ",)");
        j = 0;
        k = 0;
        while (isNumeric(trim(splitByCommas1[j])) && j < splitByCommas1.length) //get fill parameters for paddle1
        {
          fillParameters.add(int(trim(splitByCommas1[j])));
          j++;
        }
        while (isNumeric(trim(splitByCommas2[k])) && k < splitByCommas2.length) //get fill parameters for paddle2
        {
          fillParameters.add(int(trim(splitByCommas2[k])));
          k++;
        }

        if (j == 1 && k == 1) //single parameter
        {
          if (int(fillParameters.get(0)) != int(fillParameters.get(1)))
          {
            totalScore -= deduction;
            errors.add("Paddles have different colors");
          }
          if (n == 1)
          {
            if ((int(backgroundParameters.get(0)) == int(fillParameters.get(0))) || int(backgroundParameters.get(0)) == int(fillParameters.get(1)))
            {
              closestFlag = true;
              totalScore -= deduction;
              errors.add("Paddle has color the same color as background");
            }
          }
        } else if (j == 3 && k == 3) //triple parameter
        {
          if (int(fillParameters.get(0)) != int(fillParameters.get(3)) || int(fillParameters.get(1)) != int(fillParameters.get(4)) || int(fillParameters.get(2)) != int(fillParameters.get(5)))
          {
            totalScore -= deduction;
            errors.add("Paddles have different colors");
          }
          if (n == 3)
          {
            if ((int(backgroundParameters.get(0)) == int(fillParameters.get(0)) && int(backgroundParameters.get(1)) == int(fillParameters.get(1)) &&
              int(backgroundParameters.get(2)) == int(fillParameters.get(2))) || (int(backgroundParameters.get(0)) == int(fillParameters.get(3)) &&
              int(backgroundParameters.get(1)) == int(fillParameters.get(4)) &&  int(backgroundParameters.get(2)) == int(fillParameters.get(5))))
            {
              closestFlag = true;
              totalScore -= deduction;
              errors.add("Paddle has same color as background");
            }
          }
        } else
        {
          totalScore -= deduction;
          errors.add("Paddles have different colors");
        }
      }

      /*This section looks at the ellipse's color interaction with either rect and with the background*/

      if (closest != 0) //fill before ellipse
      {
        if (closest1 != 0)//fill before paddle1
        {
          splitByLeftBrace1 = splitTokens(linesFiltered.get(fills.get(cl1_index)), "(");
          splitByCommas1 = splitTokens(splitByLeftBrace1[1], ",)");

          j = 0;

          while (isNumeric(trim(splitByCommas1[j])) && j < splitByCommas1.length) //get paddle1 parameters
          {
            rect1FillParameters.add(int(trim(splitByCommas1[j])));
            j++;
          }
        } else
        {
          j = 0;
        }
        if (closest2 != 0) //fill before paddle2
        {
          splitByLeftBrace2 = splitTokens(linesFiltered.get(fills.get(cl2_index)), "(");
          splitByCommas2 = splitTokens(splitByLeftBrace2[1], ",)");
          k = 0;
          while (isNumeric(trim(splitByCommas2[k])) && k < splitByCommas2.length) //get paddle2 parameters
          {
            rect2FillParameters.add(int(trim(splitByCommas2[k])));
            k++;
          }
        } else
        {
          k = 0;
        }
        splitByLeftBrace = splitTokens(linesFiltered.get(fills.get(cl_index)), "(");
        splitByCommas = splitTokens(splitByLeftBrace[1], ",)");
        int t = 0;
        while (isNumeric(trim(splitByCommas[t])) && t < splitByCommas.length) //get ellipse parameters
        {
          ellipseFillParameters.add(int(trim(splitByCommas[t])));
          t++;
        }

        if (t == 1) //single parameter
        {
          if (j == 1)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect1FillParameters.get(0)))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as left paddle");
            }
          }
          if (k == 1)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect2FillParameters.get(0)))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as right paddle");
            }
          }
          if (n == 1)
          {
            if ((int(backgroundParameters.get(0)) == int(ellipseFillParameters.get(0))))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as background");
            }
          }
        } else if (t == 3) //triple parameters
        {
          if (k == 3)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect2FillParameters.get(0)) && int(ellipseFillParameters.get(1)) == int(rect2FillParameters.get(1))
              &&  int(ellipseFillParameters.get(2)) == int(rect2FillParameters.get(2)))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as right paddle");
            }
          }
          if (j == 3)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect1FillParameters.get(0)) && int(ellipseFillParameters.get(1)) == int(rect1FillParameters.get(1))
              &&  int(ellipseFillParameters.get(2)) == int(rect1FillParameters.get(2)))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as left paddle");
            }
          }
          if (n == 3)
          {
            if ((int(backgroundParameters.get(0)) == int(ellipseFillParameters.get(0)) && int(backgroundParameters.get(1)) == int(ellipseFillParameters.get(1)) &&
              int(backgroundParameters.get(2)) == int(ellipseFillParameters.get(2))))
            {
              totalScore -= deduction;
              errors.add("Ball has same color as background");
            }
          }
        }
      }

      /*left paddle and background.*/
      if (closest1 != 0 && !closestFlag) //fill before paddle 1
      {
        splitByLeftBrace1 = splitTokens(linesFiltered.get(fills.get(cl1_index)), "(");
        splitByCommas1 = splitTokens(splitByLeftBrace1[1], ",)");

        j = 0;

        while (isNumeric(trim(splitByCommas1[j])) && j < splitByCommas1.length)
        {
          rect1FillParameters.add(int(trim(splitByCommas1[j])));
          j++;
        }
        if (j == 1 && n == 1)
        {
          if ((backgroundParameters.get(0) == rect1FillParameters.get(0)))
          {
            totalScore -= deduction;
            errors.add("Left paddle has same color as background");
          }
        }
        if (j == 3 && n == 3)
        {
          if ((int(backgroundParameters.get(0)) == int(rect1FillParameters.get(0)) && int(backgroundParameters.get(1)) == int(rect1FillParameters.get(1)) &&
            int(backgroundParameters.get(2)) == int(rect1FillParameters.get(2))))
          {
            totalScore -= deduction;
            errors.add("Left paddle has same color as background");
          }
        }
      }

      /*right paddle and background*/
      if (closest2 != 0 && !closestFlag) //fill right paddle
      {
        splitByLeftBrace2 = splitTokens(linesFiltered.get(fills.get(cl2_index)), "(");
        splitByCommas2 = splitTokens(splitByLeftBrace2[1], ",)");

        k = 0;

        while (isNumeric(trim(splitByCommas2[k])) && k < splitByCommas2.length)
        {
          rect1FillParameters.add(int(trim(splitByCommas2[k])));
          k++;
        }
        if (k == 1 && n == 1)
        {
          if ((int(backgroundParameters.get(0)) == int(rect1FillParameters.get(0))))
          {
            totalScore -= deduction;
            errors.add("Right paddle has same color as background");
          }
        }
        if (k == 3 && n == 3)
        {
          if ((int(backgroundParameters.get(0)) == int(rect1FillParameters.get(0)) && int(backgroundParameters.get(1)) == int(rect1FillParameters.get(1)) &&
            int(backgroundParameters.get(2)) == int(rect1FillParameters.get(2))))
          {
            totalScore -= deduction;
            errors.add("Right paddle has same color as background");
          }
        }
      }

      /*if no fill in code*/
      if (closest == 0 && closest1 == 0 && closest2 == 0)
      {
        totalScore -= deduction;
        errors.add("Paddle and ball have the same color");
      }
    }
    catch (Exception e)
    {
      errors.add("Error: Make sure you followed the instructions for color in the assignment");
      totalScore -= majorExceptions;
    }
  }


  /*
  Finds the number of fills within the code
   */

  void checkFills() //check for fill
  {
    try
    {
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^fill\\(.*$") != null || match(linesFiltered.get(i), "^fill \\(.*$") != null) //look for fill( or fill ( with regex
        {
          fills.add(i);
        }
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check fills");
      totalScore -= majorExceptions;
    }
  }

  /*
  Finds the number of backgrounds within the code
   */

  void checkBackground() //check for background
  {
    try
    {
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^background.*$") != null) //look for background with regex
        {
          backgrounds.add(i);
        }
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check background");
      totalScore -= majorExceptions;
    }
  }

  /*
  Finds the number of texts within the code
   Makes sure two texts are on either side of the screen
   Follow the name of the variables to understand what's going on with each splitTokens  
   */
  void checkScores() //check for text
  {
    try
    {        
      ArrayList<Integer> parameters = new ArrayList<Integer>();     
      String[] splitByLeftBrace;
      String[] splitByCommas;
      int max = 0;
      int coordinateFlag = 0;
      boolean sizeFlag = true;
      //int textFlag = 0; // variable to check if required number of text functions are used and break code otherwise

      //make sure size is set beore writing the scores
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^textSize.*$") != null) //look for textSize with regex
        {
          sizeFlag = false;
          if (texts.size() != 0)
          {
            totalScore -= deduction;
            errors.add("size not set before text called");
            
          }
        }
        if (match(linesFiltered.get(i), "^text.*$") != null) //look for text with regex
        {
          texts.add(i);
          //textFlag++;
        }
      }
      
      //check if sufficient number of text() functions are used and break the code otherwise.
      //if(textFlag < 2){//if less than two text functions are used, this means our code will break because the won't have the required variables we need to create our getters, getLeftScore etc.
      //  if(textFlag == 0){
      //    majorError.add("Major Error: You didn't create both player scores using the text() function. Please fix this and resubmit for grading.");
      //    totalScore = 0;
      //    majorErrorFlag = true;
      //  }else if(textFlag == 1){
      //    majorError.add("Major Error: You didn't create one player scores using the text() function. Please fix this and resubmit for grading.");  
      //    totalScore = 0;
      //    majorErrorFlag = true;
      //  }
      //}

      if (sizeFlag) //if no textSize was used
      {
        totalScore -= deduction;
        errors.add("text size not set");
        //majorError.add("Major Error: text size not set. Please fix this by calling textSize() before text and resubmit for grading. Don't forget to use a variable as parameter.");
        //totalScore = 0;
        //majorErrorFlag = true;
      }

      int j = 0;
      for (int m = 0; m < texts.size(); m++) 
      {
        splitByLeftBrace = splitTokens(linesFiltered.get(texts.get(m)), "(");
        splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));

        j = 0;
        boolean magicFlag = false;
        int score  = 0;
        while (j < splitByCommas.length) // 
        {         
          if (m < 1 && j < 2 && isNumeric(splitByCommas[j])) // check for magic number in texSize() fxn. 'scoreSize'
          { 
            errors.add("use of magic numbers as parameters for textSize()");
            totalScore -= deduction;
            break;
          }

          if (m > 0 && j < 3) // check for magic numbers for both text() fxns 'scores' 
          { 
            if (j > 0) 
            {               
              if (variablesHashMap.containsKey(splitByCommas[j]))
              {
                parameters.add(int(variablesHashMap.get(splitByCommas[j])));
              } else {
                parameters.add(int(splitByCommas[j]));
              }
            }

            if (isNumeric(splitByCommas[j])) { 
              magicFlag = true;
              score = m;
            }
          }

          j++;
        }

        if (magicFlag) {
          errors.add("use of magic numbers as parameters for text() " + score ); // 'm' indicates the affected text fnx
          totalScore -= deduction;
        }
        max = max + j;
      }

      if (parameters.get(0) < (screenWidth/2)) //check left score
      {
        coordinateFlag = 1;
      } else if (parameters.get(2) < (screenWidth/2))
      {
        coordinateFlag = 2;
      } else
      {
        totalScore -= deduction;
        errors.add("left score not at left position");
      }

      if (coordinateFlag == 1) //check right score
      {
        if (parameters.get(2) < (screenWidth/2))
        {
          totalScore -= deduction;
          errors.add("right score not at right position");
        }
      } else if (coordinateFlag == 2)
      {
        if (parameters.get(0) < (screenWidth/2))
        {
          totalScore -= deduction;
          errors.add("right score not at right position");
        }
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't check scores");
      totalScore -= majorExceptions;
    }
  }

  /*
  Finds the number of ellipses within the code
   Makes sure the ellipse is at the center of the program
   Follow the name of the variables to understand what's going on with each splitTokens  
   */

  void checkEllipses()
  {
    try
    {
      ArrayList<Integer> parameters = new ArrayList<Integer>();    
      String[] splitByLeftBrace;
      String[] splitByCommas;
      int max = 0;
      int ellipseFlagSize = 0;//variable to check the number of ellipses and break the code if it's less than 1. (The need only one ellipse.)
      //Also, if ball is not a circle that should be a major Error because diameter is one of the variables that has a getter which could break the code.
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^ellipse.*$") != null) //look for ellipse( or ellipse ( with regex
        {
          ellipses.add(i);
          //ellipseFlagSize++;
        }
      }
      
      //if(ellipseFlagSize < 1){
      //  majorError.add("Major Error: You did not create a ball. Please do so and resubmit for grading.");
      //  totalScore = 0;
      //  majorErrorFlag = true;
      //}

      int j = 0;
      for (int m = 0; m < ellipses.size(); m++) 
      {
        splitByLeftBrace = splitTokens(linesFiltered.get(ellipses.get(m)), "(");
        splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));

        boolean magicFlag = false; // for magic numbers

        j = 0;
        while (j < splitByCommas.length && j < 4) //get ellipse's parameters
        { 
          //get all parameters for ellipse fnx
          if (variablesHashMap.containsKey(splitByCommas[j]))
          {
            parameters.add(int(variablesHashMap.get(splitByCommas[j])));
          } else {
            parameters.add(int(splitByCommas[j]));
          }

          if (isNumeric(splitByCommas[j])) // check for magic numbers
          {
            magicFlag = true;
          }

          // check for expressions aS PARAMS
          String[] param = splitTokens(splitByCommas[j], " ");

          if (param.length > 1) {
            magicFlag = true;
          }
          j++;
        }

        if (magicFlag) {
          errors.add("use of magic numbers as params for ellipse()");
          totalScore -= deduction;
        }
        max = max + j;
      }
      if ((parameters.get(0) < (screenWidth/2 - gap) || parameters.get(0) > (screenWidth/2 + gap)) || 
        (parameters.get(1) < (screenHeight/2 - gap) || parameters.get(1) > (screenHeight/2 + gap))) //ball at the center
      {
        totalScore -= deduction;
        errors.add("ball not at the center");
      }

      if (int(parameters.get(2)) != int(parameters.get(3))) //shape of ball
      {
        totalScore -= deduction;
        errors.add("weird ball you got there lad");
        //majorError.add("Major Error: Your ball is not a circle. Please make sure both the width and height parameters of the ball are the same and resubmit for grading.");
        //totalScore = 0 ;
        //majorErrorFlag = true;
      }

      if (parameters.size() > 4) //if more than one ball
      {
        totalScore -= deduction;
        errors.add("you have more than one ball?");
      }
    }
    catch (Exception e) 
    {
      errors.add("Error: couldn't Check ellipses");
      totalScore -= majorExceptions;
    }
  }

  boolean charIsNum(char c)  //check ascii range of char
  {
    return 48<=c&&c<=57;
  }

  boolean isNumeric(String s) //check if a number
  {
    char [] ca = s.toCharArray();
    int len = ca.length;
    boolean first = charIsNum(ca[0]);
    if (len==1) {
      return first;
    } else {
      if ( !first && ca[0]!='-') { 
        return false;
      }
      for (int i=1; i<len; i++) {
        if (!charIsNum(ca[i])) {
          return false;
        }
      }
    }
    return true;
  }

  void getVariables() 
  { 
    String[] splitByEquals;
    String[] splitBySemiColon;
    String[] splitBySpace;

    try
    {
      for (int i = 0; i < linesFiltered.size(); i++)
      {  
        if (match(linesFiltered.get(i), "=") != null)
        {
          variableLines.add(i);
        }
      }

      for (int m = 0; m < variableLines.size(); m++) 
      {
        splitByEquals = splitTokens(linesFiltered.get(variableLines.get(m)), "="); // 
        splitBySpace = trim(splitTokens(splitByEquals[0], " ")); //get variable name

        String varName = splitBySpace[splitBySpace.length-1];

        splitBySemiColon = trim(splitTokens(splitByEquals[1], ";")); //get the value of the varaible 

        String varValue = splitBySemiColon[0];

        if (isNumeric(varValue)) {
          variablesHashMap.put(varName, varValue); 
          varKeys.add(varName);
        }
      }
    }
    catch(Exception e)
    {
      errors.add("Error: couldn't get variables");
    }
  }

  void checkMovingBall()
  {
    try
    {
      int noOfMatches = 0;
      String[] splitByEquals;

      for (int k = 0; k < variableLines.size(); k++)
      {
        splitByEquals = trim(splitTokens(linesFiltered.get(variableLines.get(k)), "="));

        if ((match(splitByEquals[1], splitByEquals[0])) != null) //look with regex
        {
          for (int l = 0; l < varKeys.size(); l++) {   
            if (varKeys.get(l).equals(varKeys.get(l))) {
              noOfMatches++;
            }
          }
        }
      }

      if (noOfMatches < 2)
      {
        totalScore -= deduction;
        errors.add("ball not moving the right way");
      }
      //End of checking if the ball is moving
    }
    catch(Exception e)
    {
      errors.add("Error: couldn't get moving ball");
    }
  }

  void debug(boolean mode){
    if(mode = true){
      println("----------------------");
      println("Debug");
      println("----------------------");
      println(" ");
       //Print states
      println("State after 45 frames for scenario 1 - bounce"+yvalBounce);
      println(" ");
      println("State after 45 frames for scenario 2 - moveLeft"+xvalLeft);
      println("rightScore:"+ scoresR);
      println(" ");
      println("State after 45 frames for scenario 3 - moveRight"+xvalRight);
      println("leftScore:"+ scoresL);
      println(" ");
      
      println("State after 45 frames for scenario 4 - bounceOffRightPaddle"+rightBounceVals);
      println(" ");
      
      println("State after 45 frames for scenario 5 - bounceOffLeftPaddle"+leftBounceVals);
      println(" ");
      
      println("State after 45 frames for scenario 6 - checkLeftPaddleMoving"+leftPaddlePos);
      println(" ");
      
      println("State after 45 frames for scenario 7 - checkRightPaddleMoving"+rightPaddlePos);
      println(" ");
   
    }
  }
  
  //Check if Functions exist and work. Their functioanlity are being checked by other means
  void checkFunctions(){
    //Check setGameMode
    try{
      code.setGameMode();
    }catch(Exception e){
      test.totalScore -= test.deduction;
      println("The function setGameMode() doesn't exist. Ensure your function is named properly if you created it.");
    }
    
    //Check checkWall
    try{
        code.checkWall();
      }catch(Exception e){
        test.totalScore -= test.deduction;
        println("The function checkWall() doesn't exist. Ensure your function is named properly if you created it.");
      }
      
    //Check moveBall
    try{
      code.moveBall();
    }catch(Exception e){
      test.totalScore -= test.deduction;
      println("The function moveBall() doesn't exist. Ensure it is named properly if you created it.");
    }
    
    //Check displayPaddles
      try{
      code.displayPaddles();
      }catch(Exception e){
        test.totalScore -= test.deduction;
        println("The function displayPaddles() doesn't exist. Ensure it is named properly if you created it.");
      }
      
    //Check displayBall()
      try{
        code.displayBall();
      }catch(Exception e){
        test.totalScore -= test.deduction;
        println("The function displayBall() doesn't exist. Ensure it is named properly if you created it.");
      }
    //Check displayScores()
    try{
    code.displayScores();
    }catch(Exception e){
      test.totalScore -= test.deduction;
      println("The function displayScores() doesn't exist. Ensure it is named properly if you created it.");
    }    
    
    //Check checkLeftPaddle() 
    try{
    code.checkLeftPaddle();
    }catch(Exception e){
      test.totalScore -= test.deduction;
      println("The function checkLeftPaddle() doesn't exist. Ensure it is named properly if you created it.");
    }
    
    //Check rightPaddle()
    try{
    code.checkRightPaddle();
    }catch(Exception e){
      test.totalScore -= test.deduction;
      println("The function checkRightPaddle() doesn't exist. Ensure it is named properly if you created it.");
    }
    
  }

  void generateStates() {
    
    try
    {
      //Start simulation
      mousePressed = true;
      int x = 10;
      int y = 10;
      
      
      // Gather states of 45 frames
      for(int i=0; i<45;i++){
          
          //Generates the state for scenario 1
          code1.forever();
          yvalBounce.add(code1.ballY());
          
          //Generates the state for scenario 2
          code2.forever();
          xvalLeft.add(code2.ballX());
          scoresR.add(code2.rightScore());
          
          //Generates the state for scenario 3
          code3.forever();
          xvalRight.add(code3.ballX());
          scoresL.add(code3.leftScore());
          
          //Generate the state for scenario 4
          code4.forever();
          rightBounceVals.add(code4.ballX());
          
          //Generate the state for scenario 5
          code5.forever();
          leftBounceVals.add(code5.ballX());
          
          //Generate state for scenario 6 - Checking if left Paddle Moves.
          code6.forever();
          leftPaddlePos.add(code6.leftPaddleY());
          code6.setMouseY(x);
          //println(code6.getMouseY());
          x = x + 10;
          
          //Generate state for scenario 7 - Checking if right Paddle Moves.
          code7.forever();
          rightPaddlePos.add(code7.rightPaddleY());
          //println(code7.rightPaddleY());
          code7.setMouseY(y);
          y = y + 10;
        }
      
      }
      catch(Exception e)
      {
        println("Code runtime error:" +e);
        test.totalScore = 0;
        test.printResults();
        exit();
      }
  }
  

  void checkLeftWall(){
    boolean correct = true;

    // If the ball crosses the left it will have a value larger than the screenWidth
    int minVal = Collections.min(xvalLeft);
    int minValIndex = xvalLeft.indexOf(minVal);

    int minValScore = scoresR.get(minValIndex);
    int nextScoreAfterMin = scoresR.get(minValIndex + 1);

    boolean thereIsAnIncrease = Collections.max(scoresR) != Collections.min(scoresR);
    // boolean rightScoreIncreased = minValScore < nextScoreAfterMin;
    if(!thereIsAnIncrease){
      correct = false;
      errors.add("Check whether the scores change on crossing the lefthand wall");
    } 

    // If ball leaves the screen, even a little
    if( minVal < 0 - Math.abs(code2.ballXSpeed())  ){
        correct = false;
        String err = "The game does not reset after crossing the left wall";
        errors.add(err);
      }
      //return;

      if(!correct) test.totalScore -= test.deduction;
  }

    
  void checkRightWall(){
      boolean correct = true;

      // If the ball crosses the right it will have a value larger than the screenWidth
      int maxVal = Collections.max(xvalRight);
      int maxValIndex = xvalRight.indexOf(maxVal);

      int maxValScore = scoresL.get(maxValIndex);
      int nextScoreAfterMax = scoresL.get(maxValIndex + 1);

      boolean thereIsAnIncrease = Collections.max(scoresL) != Collections.min(scoresL);
      // boolean leftScoreIncreased = maxValScore < nextScoreAfterMax && thereIsAnIncrease;
      
      if(!thereIsAnIncrease){
        correct = false;
        errors.add("Check whether the scores change on crossing the righthand wall");
      } 

      // If ball leaves the screen, even a little

      if( maxVal > screenWidth + Math.abs(code3.ballXSpeed()) ){
        correct = false;
        String err = "The game does not reset after crossing the right wall";
        errors.add(err);
      }

      if(!correct) test.totalScore -= test.deduction;
      //return;
  }


    void setInitialConditions(){
      // Place the ball at the center
      int screenCentreX = (int) Math.floor(0.5 * screenWidth);
      int screenCentreY = (int) Math.floor(0.5 * screenHeight);
      int paddleCentreY1 = (int) Math.floor(screenCentreY - (code4.paddleHeight()/2));
      int paddleCentreY2 = (int) Math.floor(screenCentreY - (code5.paddleHeight()/2));
      
      
      // Set x and y positions of ball in all scenarios 
      // TODO: refactor later
      code1.setballX(screenCentreX);
      code2.setballX(screenCentreX);
      code3.setballX(screenCentreX);
      code4.setballX(screenCentreX);
      code5.setballX(screenCentreX);
      code6.setballX(screenCentreX);
      code7.setballX(screenCentreX);

      code1.setballY(screenCentreY);
      code2.setballY(screenCentreY);
      code3.setballY(screenCentreY);
      code4.setballY(screenCentreY);
      code5.setballY(screenCentreY);
      code6.setballY(screenCentreY);
      code7.setballY(screenCentreY);
      
      // Initial conditions for scenario 1 - Bounce
      code1.setballYSpeed(50);
      code1.setballXSpeed(0);
      
      // Initial conditions for scenario 2 - Move left
      code2.setballYSpeed(0);
      code2.setballXSpeed(-50);
      
      // Initial conditions for scenario 3 - Move right
      code3.setballYSpeed(0);
      code3.setballXSpeed(50);
      
      //Initial conditions for scenario 4 - Move right
      code4.setballYSpeed(0);
      code4.setballXSpeed(50); 
      //code4.setrightPaddleX(screenWidth - code4.paddleWidth()); // set X coordinate of paddle
      code4.setrightPaddleY(paddleCentreY1);
      code4.setpaddleHeight(screenHeight);
      
      //Initial conditions for scenario 5 - Move left
      code5.setballYSpeed(0);
      code5.setballXSpeed(-50);
      //code5.setleftPaddleX(0); // set X coordinate of paddle
      code5.setleftPaddleY(paddleCentreY2);
      code5.setpaddleHeight(screenHeight);
      
      //Initial conditions for scenario 6 - Left Paddle Movement
      code6.setleftPaddleY(0);
      code6.setMouseX(10);
    
      
      //Initial conditions for scenario 7 - Right Paddle Movement.
      code7.setrightPaddleY(0);
      code7.setMouseX(screenWidth/2 + 100);
      
      
    }

  
  void checkWallsBounce(){
      int minIndex = yvalBounce.indexOf(Collections.min(yvalBounce));
      int maxIndex = yvalBounce.indexOf(Collections.max(yvalBounce));
      
      // Test upper wall bounce.  - If min is the first or last element it means there was no bounce.
      if(minIndex == (yvalBounce.size()-1) || minIndex == 0 ){ 
        test.totalScore -= test.deduction;
        String err = "Ball does not bounce off top";
        errors.add(err);
        //return;
      }
      else if ( yvalBounce.get(minIndex+1) > yvalBounce.get(minIndex) && yvalBounce.get(minIndex-1) > yvalBounce.get(minIndex)){
        count++; //Ball bounces above. Proceed to confirm for below.
      }
      

      //test lower wall bounce
      if(maxIndex == (yvalBounce.size()-1) || maxIndex == 0){
        test.totalScore -= test.deduction;
        String err = "Ball does not bounce off bottom";
        errors.add(err);
      }
      else if ( yvalBounce.get(minIndex+1) > yvalBounce.get(minIndex) && yvalBounce.get(minIndex-1) > yvalBounce.get(minIndex)){
        count++;
      }
         
  }
  
  //Check whether paddles move
  void checkMovePaddlesRight(){
    boolean moveFlag = false;
    for(int i = 0; i < rightPaddlePos.size()-1; i++){
      if(i< 10 && rightPaddlePos.get(i+1)<=rightPaddlePos.get(i)){
        moveFlag = true;
      }else if(rightPaddlePos.get(i+1)<=rightPaddlePos.get(i)){
        moveFlag = true;
      }
      
    }
    
    if(moveFlag){
      test.totalScore -= test.deduction;
      String err = "Right paddle does not move";
      errors.add(err);
    }
  }
  
  void checkMovePaddlesLeft(){
    boolean moveFlag = false;
    for(int i = 0; i < leftPaddlePos.size()-1; i++){
      if(leftPaddlePos.get(i+1)<=leftPaddlePos.get(i)){
        moveFlag = true;
      }
    }
    
    if(moveFlag){
      test.totalScore -= test.deduction;
      String err = "Left paddle does not move";
      errors.add(err);
    }
  }
  
  //Check if ball bounces of left paddle
  void checkLeftPaddleBounce(){
    int minIndex = leftBounceVals.indexOf(Collections.min(leftBounceVals));
      int maxIndex = leftBounceVals.indexOf(Collections.max(leftBounceVals));
      
      // Test upper wall bounce.  - If min is the first or last element it means there was no bounce.
      if(minIndex == (leftBounceVals.size()-1) || minIndex == 0 ){ 
        test.totalScore -= test.deduction;
        String err = "Ball does not bounce off left Paddle";
        errors.add(err);
        //return;
      }
      else if ( leftBounceVals.get(minIndex+1) > leftBounceVals.get(minIndex) && leftBounceVals.get(minIndex-1) > leftBounceVals.get(minIndex)){
        count++; //Ball bounces above. Proceed to confirm for below.
      }
      
      //if(maxIndex == (leftBounceVals.size()-1) || maxIndex == 0){
      //  test.totalScore -= test.deduction;
      //  String err = "Ball does not bounce off left Paddle";
      //  errors.add(err);
      //}
      //else if ( leftBounceVals.get(minIndex+1) > leftBounceVals.get(minIndex) && leftBounceVals.get(minIndex-1) > leftBounceVals.get(minIndex)){
      //  count++;
      //}
      
  }
  
  
  
  
  //Check if ball bounces off right paddle
  void checkRightPaddleBounce(){
      int maxIndex = rightBounceVals.indexOf(Collections.max(rightBounceVals));
      
      if(maxIndex == (rightBounceVals.size()-1) || maxIndex == 0){
        test.totalScore -= test.deduction;
        String err = "Ball does not bounce off right Paddle";
        errors.add(err);
      }
      //else if ( rightBounceVals.get(minIndex+1) > rightBounceVals.get(minIndex) && rightBounceVals.get(minIndex-1) > rightBounceVals.get(minIndex)){
      //  count++;
      //}
  }
  
  void logFilesWithErrors(){
    PrintWriter output = createWriter("error_logs.txt");
    output.println(filePath);
    output.flush();
    output.close();
  } 

  void checkBallIsMoving(){
    // We can just check one of the generated state maps if there is movement
    int minValX = Collections.min(xvalLeft);
    int maxValX = Collections.max(xvalLeft);

    // If the state remains the same, there is no movement.
    if(minValX == maxValX) {
      errors.add("Error: Check if ball is moving.");
    }
  }
  
  //This function checks if the boolean gameOn exists and breaks code otherwise.
  void checkGameOn() 
  {
    try
    {
      String[] splitBySemiColon;
      String[] splitBySpace;
      
      for (int m = 0; m < linesFiltered.size(); m++) 
      {         
        if(match(linesFiltered.get(m), "^boolean.*$") != null) {
          
          splitBySemiColon = trim(splitTokens(linesFiltered.get(m), ";"));
          
          splitBySpace = trim(splitTokens(splitBySemiColon[0], " "));
          
          varNamesHashMap.put("gameOn", trim(splitBySpace[1]));
          
        }
      }
      
      
      //if(varNamesHashMap.size()!= 1){//if gameOn variable was not put in hashMap
        
      //  majorError.add("You do not have the boolean variable gameOn. Please fix this and resubmit for grading.");
      //  totalScore = 0;
        
      //}
    }
    catch(Exception e)
    {
      // println("couldnt get boolean vars" + e);
    }
  }

  void printResults() {
    if (totalScore < 0)
    {
      totalScore = 0;
    }
    println(totalScore, errors);
  }
  
  //Checks if there is a major Error and breaks code.
  //void checkMajorErrors(){
  //  int errorFlag = majorError.size();
  //  if(errorFlag > 0){
  //    majorErrorFlag = true;
  //    println("There's a major Error in student code... Should be fixed and resubmitted for a regrade!");
  //    //println("Total Score =" + totalScore);
  //  }
    
  //  if(majorErrorFlag == true){
  //    totalScore = 0;
  //    print(totalScore, majorError);
  //    exit();
  //  }
    
  //}

  /***************************************************************
   main method that calls all other methods to grade the assigment
   checks wheter screenWith and sreenHeight were gotten 
   grades if true and doesnt if false
   ****************************************************************/
  void run() {
    getLines();
    removeEmptyLines();
    if (getScreenSize()) {
      checkTabs();
      getVariables();
      checkStatementsPerLine();
      checkComments();
      checkBackground();
      checkFills();
      checkStrokes();
      checkEllipses();
      checkRects();
      checkScores();
      // checkMovingBall(); Replaced in favour of checkBallIsMoving() which uses state map
      shapeColorInteractions();

      setInitialConditions();
      //try{
      generateStates();
      //}catch(AWTException e){println(e);}
      checkFunctions();
      checkBallIsMoving();
      checkWallsBounce();
      checkLeftWall();
      checkRightWall();
      checkLeftPaddleBounce();
      checkRightPaddleBounce();
      checkMovePaddlesRight();
      checkMovePaddlesLeft();

      checkGameOn();
      //checkMajorErrors();
      printResults(); // We probably would want to printResults after running Getcode and Pong_3.
      debug(true);
    } else {
      totalScore = 0;
      String err = "Could not grade assignment: Check log at error_logs.txt. Skipping ...";
      
      logFilesWithErrors();
      print(err);
      print(totalScore, errors);
    }
    
  }
}
