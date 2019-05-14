import java.io.BufferedWriter;
import java.io.FileWriter;
//class for autoGrad assignment 1

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

  ArrayList<String> errors = new ArrayList<String>(); //stroke lines

  float totalScore = 20; // total score of the student
  float majorExceptions = 2; //deductions that generate exceptions, ie code that won't likely compile
  int gap = 5; //interval due to floating divisions
  int screenWidth, screenHeight; //height and width of screen
  float deduction = 1; //deduction for each section missed
  float commentPercentage = 0.3; //percentage error for floatation divisions
  int tabLength = 2;

  File filePath;
  String studentName;
  int groupNumber;

  /* checkEllipses(); threw an error when there was string parameter
    Was trying to fix that by checking for the ellipse and analysing parameters in
    2 different functions, checkEllipse and getEllipse
  */
  boolean gotEllipses = true;
  ArrayList<Integer> ellipseParameters = new ArrayList<Integer>();

  Test(File x, String name, int group) {
    filePath = x;
    studentName = name;
    groupNumber = group;
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
      exit();
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

              if(tokens[0] != null && matchAll(tokens[0], ";").length > 1) {
                statementsFlag = true;
              }
            }
          }
        }
      }

      if (statementsFlag)
      {
        errors.add("2 or more ;s on a line");
        totalScore -= deduction;
      }
    }
    catch (Exception e)
    {
      errors.add("Error: couldn't check statements per line");
      //totalScore -= majorExceptions;
    }
  }

  /*
  This line parses the first comment in the line and gets the size of the screen used by the device, it just keeps splitting by tokens
   Follow the name of the variables to understand what's going on with each splitTokens
   */

  void getScreenSize() //gets first comment line
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
        totalScore = 0;
      }

      //get height
      i = 0;
      while (!(isNumeric(splitBySpacesRight[i])) && i < splitBySpacesRight.length) //parse for numeric value
      {
        i++;
      }

      if (i == (splitBySpacesRight.length - 1) && i != 0) //if invalid height, quit program and give zero
      {
        errors.add("check height in code");
        totalScore = 0;
      }

      screenHeight = int(trim(splitBySpacesRight[i])); //get screen height
    }
    catch (Exception e)
    {
      errors.add("Error: check syntax of width and height at first line of code");
      //totalScore -= majorExceptions;
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
        if (match(linesFiltered.get(i), "^stroke.*$") != null)//look for stroke with regex
        {
          strokes.add(i);
        }
      }

      if (strokes.size() == 0) //if no stroke
      {
        totalScore -= deduction;
        errors.add("use at least one stroke function");
      }

      int j = 0;
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

      int parameterSize = parameters.size();

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
    catch (Exception e)
    {
      errors.add("Error: check stroke function");
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

      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^rect.*$") != null) //look for rect with regex
        {
          rects.add(i);
        }
      }

      int j = 0;
      for (int m = 0; m < rects.size(); m++) {
        splitByLeftBrace1 = splitTokens(linesFiltered.get(rects.get(m)), "(");
        splitByCommas1 = splitTokens(splitByLeftBrace1[1], ",)");

        j = 0;
        while (isNumeric(trim(splitByCommas1[j])) && j < splitByCommas1.length) //get parameters
        {
          parameters.add(int(trim(splitByCommas1[j])));
          j++;
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
        errors.add("left paddle not at 0 0");
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
        errors.add("you have more than two paddles? use only two rectangles before grade is released");
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
   This is not necessarily the case as fill(0) = fill(0 0 0) and fill(255) = fill(255,255,255)
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
            errors.add("paddles have different colors");
          }
          if (n == 1)
          {
            if ((int(backgroundParameters.get(0)) == int(fillParameters.get(0))) || int(backgroundParameters.get(0)) == int(fillParameters.get(1)))
            {
              closestFlag = true;
              totalScore -= deduction;
              errors.add("paddle has color the same color as background");
            }
          }
        } else if (j == 3 && k == 3) //triple parameter
        {
          if (int(fillParameters.get(0)) != int(fillParameters.get(3)) || int(fillParameters.get(1)) != int(fillParameters.get(4)) || int(fillParameters.get(2)) != int(fillParameters.get(5)))
          {
            totalScore -= deduction;
            errors.add("paddles have different colors");
          }
          if (n == 3)
          {
            if ((int(backgroundParameters.get(0)) == int(fillParameters.get(0)) && int(backgroundParameters.get(1)) == int(fillParameters.get(1)) &&
              int(backgroundParameters.get(2)) == int(fillParameters.get(2))) || (int(backgroundParameters.get(0)) == int(fillParameters.get(3)) &&
              int(backgroundParameters.get(1)) == int(fillParameters.get(4)) &&  int(backgroundParameters.get(2)) == int(fillParameters.get(5))))
            {
              closestFlag = true;
              totalScore -= deduction;
              errors.add("paddle has same color as background");
            }
          }
        } else
        {
          totalScore -= deduction;
          errors.add("paddles have different colors");
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
          if (t == j)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect1FillParameters.get(0)))
            {
              totalScore -= deduction;
              errors.add("ball has same color as left paddle");
            }
          }
          if (t == k)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect2FillParameters.get(0)))
            {
              totalScore -= deduction;
              errors.add("ball has same color as right paddle");
            }
          }
          if (n == 1)
          {
            if ((int(backgroundParameters.get(0)) == int(ellipseFillParameters.get(0))))
            {
              totalScore -= deduction;
              errors.add("ball has same color as background");
            }
          }
        } else if (t == 3) //triple parameters
        {
          if (t == k)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect2FillParameters.get(0)) && int(ellipseFillParameters.get(1)) == int(rect2FillParameters.get(1))
              &&  int(ellipseFillParameters.get(2)) == int(rect2FillParameters.get(2)))
            {
              totalScore -= deduction;
              errors.add("ball has same color as right paddle");
            }
          }
          if (t == j)
          {
            if (int(ellipseFillParameters.get(0)) == int(rect1FillParameters.get(0)) && int(ellipseFillParameters.get(1)) == int(rect1FillParameters.get(1))
              &&  int(ellipseFillParameters.get(2)) == int(rect1FillParameters.get(2)))
            {
              totalScore -= deduction;
              errors.add("ball has same color as left paddle");
            }
          }
          if (n == 3)
          {
            if ((int(backgroundParameters.get(0)) == int(ellipseFillParameters.get(0)) && int(backgroundParameters.get(1)) == int(ellipseFillParameters.get(1)) &&
              int(backgroundParameters.get(2)) == int(ellipseFillParameters.get(2))) || (int(backgroundParameters.get(0)) == int(ellipseFillParameters.get(3)) &&
              int(backgroundParameters.get(1)) == int(ellipseFillParameters.get(4)) &&  int(backgroundParameters.get(2)) == int(ellipseFillParameters.get(5))))
            {
              totalScore -= deduction;
              errors.add("ball has same color as background");
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
            errors.add("left paddle has same color as background");
          }
        }
        if (j == 3 && n == 3)
        {
          if ((int(backgroundParameters.get(0)) == int(rect1FillParameters.get(0)) && int(backgroundParameters.get(1)) == int(rect1FillParameters.get(1)) &&
            int(backgroundParameters.get(2)) == int(rect1FillParameters.get(2))))
          {
            totalScore -= deduction;
            errors.add("left paddle has same color as background");
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
            errors.add("right paddle has same color as background");
          }
        }
        if (k == 3 && n == 3)
        {
          if ((int(backgroundParameters.get(0)) == int(rect1FillParameters.get(0)) && int(backgroundParameters.get(1)) == int(rect1FillParameters.get(1)) &&
            int(backgroundParameters.get(2)) == int(rect1FillParameters.get(2))))
          {
            totalScore -= deduction;
            errors.add("right paddle has same color as background");
          }
        }
      }

      /*if no fill in code*/
      if (closest == 0 && closest1 == 0 && closest2 == 0)
      {
        totalScore -= deduction;
        errors.add("paddle and ball have the same color");
      }
    }
    catch (Exception e)
    {
      errors.add("Error: couldn't check shape color interactions");
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
        if (match(linesFiltered.get(i), "^fill.*$") != null) //look for fill with regex
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
        }
      }

      if (sizeFlag) //if no textSize was used
      {
        totalScore -= deduction;
        errors.add("text size not set");
      }

      int j = 0;
      for (int m = 0; m < texts.size(); m++) {
        splitByLeftBrace = splitTokens(linesFiltered.get(texts.get(m)), "(");
        splitByCommas = splitTokens(splitByLeftBrace[1], ",)");

        j = 1;
        while (isNumeric(trim(splitByCommas[j])) && j < splitByCommas.length)
        {
          parameters.add(int(trim(splitByCommas[j])));
          j++;
        }
        max = max + j-1; //because j is starting from 1
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
  void getEllipses()
  {
    try
    {
      String[] splitByLeftBrace;
      String[] splitByCommas;
      int max = 0;

      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^ellipse.*$") != null) //look for ellipse with regex
          {
          ellipses.add(i);
          }
        }

      int j = 0;
      for (int m = 0; m < ellipses.size(); m++) {
        splitByLeftBrace = splitTokens(linesFiltered.get(ellipses.get(m)), "(");
        splitByCommas = splitTokens(splitByLeftBrace[1], ",)");

        j = 0;
        while (isNumeric(trim(splitByCommas[j])) && j < splitByCommas.length) //get ellipse's parameters
        {
          ellipseParameters.add(int(trim(splitByCommas[j])));
          j++;
        }
        max = max + j;
      }
    }
    catch (Exception e)
    {
      gotEllipses = false;
      errors.add("Error: couldn't get ellipses");
    }
  }

  void checkEllipses()
  {
  try
  {
    if(ellipseParameters.size() == 0)
    {
      errors.add("Ellipse contains invalid parameters");
      totalScore -= deduction;
    }

    else if(gotEllipses) {
      if ((ellipseParameters.get(0) < (screenWidth/2 - gap) || ellipseParameters.get(0) > (screenWidth/2 + gap)) ||
        (ellipseParameters.get(1) < (screenHeight/2 - gap) || ellipseParameters.get(1) > (screenHeight/2 + gap))) //ball at the center
      {
        totalScore -= deduction;
        errors.add("ball not at the center");
      }

      if (int(ellipseParameters.get(2)) != int(ellipseParameters.get(3))) //shape of ball
      {
        totalScore -= deduction;
        errors.add("weird ball you got there lad | the ball should be a circle");
      }

      if (ellipseParameters.size() > 4) //if more than one ball
      {
        totalScore -= deduction;
        errors.add("you have more than one ball?");
      }
    }
  }
  catch (Exception e)
    {
      errors.add("Error: couldnt check ellipses " + e);
    }
  }

  void createResultsCsvFile() {
    String fileName = "/Results/Suacode Africa " + groupNumber + "/results.csv";
    try
    {
     appendTextToFile(fileName, studentName + "," + totalScore + ",Errors: \n");
      for (int i = 0; i < errors.size(); i++) {
        appendTextToFile(fileName, "  ,  ," + errors.get(i) + "\n");
      }
     appendTextToFile(fileName, "\n");
    }
    catch(Exception e)
    {
      errors.add("Error: couldn't create resultsfile");
    }
  }
  
  void appendTextToFile(String filename, String text){
    File f = new File( sketchPath() + filename);
    if(!f.exists()){
      createFile(f);
    }
    try {
      PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
      out.print(text);
      out.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
  }
  
  void createFile(File f){
    File parentDir = f.getParentFile();
    try {
      parentDir.mkdirs(); 
      f.createNewFile();
    } catch(Exception e) {
      e.printStackTrace();
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

  void run() {
    getLines();
    checkTabs();
    removeEmptyLines();
    checkStatementsPerLine();
    getScreenSize();
    checkComments();
    checkBackground();
    checkFills();
    checkStrokes();
    getEllipses();
    checkEllipses();
    checkRects();
    checkScores();
    shapeColorInteractions();
    createResultsCsvFile();
    //printResults();
  }
}
