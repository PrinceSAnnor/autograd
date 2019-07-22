import java.util.Map;
import java.util.Collections;

class GetCode {
  
  PrintWriter output = createWriter(sketchPath()+"/../Code.pde");
  
  String[] fileLines;
  ArrayList<String> linesFiltered = new ArrayList<String>(); //filtered lines ie no empty lines
  ArrayList<Integer> rects = new ArrayList<Integer>(); //rect lines
  ArrayList<Integer> ellipses = new ArrayList<Integer>(); //ellipse lines
  ArrayList<Integer> texts = new ArrayList<Integer>(); //text lines
  ArrayList<Integer> lines = new ArrayList<Integer>(); //line lines
  
  ArrayList<Integer> variableLines = new ArrayList<Integer>(); //lines with variables
  HashMap<String,String> variablesHashMap = new HashMap<String,String>(); //Hashmap contaning variables
  ArrayList<String> varKeys = new ArrayList<String>(); //variable names
  
  HashMap<String,String> varNamesHashMap = new HashMap<String,String>(); //Hashmap contaning variables
  
  File filePath;
  
  GetCode(File f) {
    filePath = f;
  }
  
  int screenWidth, screenHeight;

  /*
  In the function below, I'm reading the file into an array of strings. Each element in the array is a line in the file
   */
  void getLines() { //reads file
    try
    {
      fileLines = loadStrings(filePath); //comment if you're using APDE
    }
    catch (Exception e) //IO error
    {
      // println("Couldn't load file");
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
        if (fileLines[i] != null && fileLines[i].length() > 0) //if lines have no content or a null string
          linesFiltered.add(trim(fileLines[i]));
        else
          emptyLines++;
      }
      if (emptyLines < 2) //if at least two lines are empty
      {
        // println("Improper code grouping");
        
      }
    }
    catch (Exception e) //catch exception
    {
      // println("Couldn't remove empty lines in file");
    }
  }
  

  /*
  gets the parameters of the rects into an array
   Follow the name of the variables to understand what's going on with each splitTokens
   */

   
/*
  This function pre-sets the values of the varNamesHashMap
*/
void presetValues(){
  //varNamesHashMap.put("wierd", "-99");
  varNamesHashMap.put("leftPaddleX", "wierd");
  varNamesHashMap.put("leftPaddleY", "wierd");
  varNamesHashMap.put("paddleWidth", "wierd");
  varNamesHashMap.put("paddleHeight", "wierd");
  varNamesHashMap.put("rightPaddleX", "wierd");
  varNamesHashMap.put("rightPaddleY", "wierd");
  varNamesHashMap.put("textsize", "wierd");
  varNamesHashMap.put("leftScore", "wierd");
  varNamesHashMap.put("leftScoreX", "wierd");
  varNamesHashMap.put("scoreY", "wierd");
  varNamesHashMap.put("rightScore", "wierd");
  varNamesHashMap.put("rightScoreX", "wierd");
  varNamesHashMap.put("ballX", "wierd");
  varNamesHashMap.put("ballY", "wierd");
  varNamesHashMap.put("ballXSpeed", "wierd");
  varNamesHashMap.put("ballYSpeed", "wierd");
  varNamesHashMap.put("diameter", "wierd");
  varNamesHashMap.put("gameOn", "wierd");

}

boolean getScreenSize() //gets first comment line
  {
    try
    {
      String[] splitByComma = splitTokens(linesFiltered.get(0), ",;"); 
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
      // if( !isNumeric(screenWidth) )errors.add("Your screenwidth is not a numeric value");
      
      screenWidth = int(trim(splitBySpacesLeft[i]));//get screen height

      if (i == (splitBySpacesLeft.length - 1) && i != 0) //if invalid width, quit program and give zero
      {
        //errors.add("check width in code");
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
        //errors.add("check height in code.");
        //majorError.add("Major Error: check height in first line of code. Replace the *** with your maxY value and resubmit for grading.");
        //totalScore = 0;
        //majorErrorFlag = true;
      }

      //screenHeight = int(trim(splitBySpacesRight[i])); //get screen height
      return true;
    } 
    catch (Exception e)
    {
      //errors.add("Error: check syntax of width and height at first line of code");
      //majorError.add("Major Error: check syntax of width and height at first line of code. Replace the ** with your maxX and maXY values and resubmit for grading.");
      //totalScore = 0;
      //majorErrorFlag = true;
      return false;
    }
  }

void checkRects() //check rects
  {
    try
    {
      String[] splitByLeftBrace1;
      String[] splitByCommas1;
      int max = 0;      
      
      //int recCounter = 0;//parameter to check if two rectangles (paddles) are used.
      for (int i = 0; i < linesFiltered.size(); i++) 
      {
        if (match(linesFiltered.get(i), "^rect.*$") != null) //look for rect with regex
        {
          rects.add(i);
          //recCounter++;
        }
      }
      
      ////check if rects are used and tells us why it didn't grade.
      //if(recCounter < 2){   
      //  //println("Student did not create a paddle or both paddles.");
      //  if(recCounter == 0){
      //    println("Student did not create both paddles");
      //  }else if(recCounter == 1){
      //    println("Student only created one paddle.");
      //  }
        
      //}
      
      //putting -99 for all variable names at first. So if we get -99 returned, we know that the student didn't 
      //create that variable and the getter is not valid.
      //int i = 0;
      //for (int m = 0; m < rects.size(); m++) {
      //  splitByLeftBrace1 = splitTokens(linesFiltered.get(rects.get(m)), "(");
      //  splitByCommas1 = trim(splitTokens(splitByLeftBrace1[1], ",)"));
        
      //  i = 0;
      //  while (i < splitByCommas1.length && i < 4) //get parameters
      //  {  
      //    if(m == 0) {
      //      if( i == 0) {
      //        varNamesHashMap.put("leftPaddleX", "-99");
      //      } else if( i == 1) {
      //        varNamesHashMap.put("leftPaddleY", "-99");
      //      } else if( i == 2) {
      //        varNamesHashMap.put("paddleWidth", "-99");
      //      } else if( i == 3) {
      //        varNamesHashMap.put("paddleHeight", "-99");
      //      }
      //    } else if(m == 1) {
      //      if( i == 0) {
      //        varNamesHashMap.put("rightPaddleX", "-99");
      //      } else if( i == 1) {
      //        varNamesHashMap.put("rightPaddleY", "-99");
      //      }
      //    }
      //    i++;
      //  }
      //  max = max + i;
      //}
      
      int j = 0;
      max = 0;
      for (int m = 0; m < rects.size(); m++) {
        splitByLeftBrace1 = splitTokens(linesFiltered.get(rects.get(m)), "(");
        splitByCommas1 = trim(splitTokens(splitByLeftBrace1[1], ",)"));
        
        j = 0;
        while (j < splitByCommas1.length && j < 4) //get parameters
        {  
          if(m == 0) {
            if( j == 0) {
              varNamesHashMap.put("leftPaddleX", splitByCommas1[j]);
            } else if( j == 1) {
              varNamesHashMap.put("leftPaddleY", splitByCommas1[j]);
            } else if( j == 2) {
              varNamesHashMap.put("paddleWidth", splitByCommas1[j]);
            } else if( j == 3) {
              varNamesHashMap.put("paddleHeight", splitByCommas1[j]);
            }
          } else if(m == 1) {
            if( j == 0) {
              varNamesHashMap.put("rightPaddleX", splitByCommas1[j]);
            } else if( j == 1) {
              varNamesHashMap.put("rightPaddleY", splitByCommas1[j]);
            }
          }
          j++;
        }
        max = max + j;
      }
    }
    catch (Exception e) 
    {
      // println("Couldn't check rects");
    }
  }

  /*
  Finds the number of texts within the code
  Gets the positions of the scores
   Follow the name of the variables to understand what's going on with each splitTokens  
   */
  void checkScores() //check for text
  {
    try
    {        
      String[] splitByLeftBrace;
      String[] splitByCommas;
      int max = 0;
      boolean sizeFlag = true;
      
      //make sure size is set beore writing the scores
      for (int i = 0; i < linesFiltered.size(); i++)
      {
        if (match(linesFiltered.get(i), "^textSize.*$") != null) //look for textSize with regex
        {
          sizeFlag = false;
          if (texts.size() != 0)
          {
            // println("size not set before text called");
          }
        }
        if (match(linesFiltered.get(i), "^text.*$") != null) //look for text with regex
        {
          texts.add(i);
        }
      }

      if (sizeFlag) //if no textSize was used
      {
        // println("text size not set");
      }
      
      
      int j = 0;
      max = 0;
      for(int m = 0; m < texts.size(); m++) 
      {
        splitByLeftBrace = splitTokens(linesFiltered.get(texts.get(m)), "(");
        splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));
        
        j = 0;
        while(j < splitByCommas.length) // 
        {
          
          if(m == 0) {
            if(j == 0) {
              varNamesHashMap.put("txtSize", splitByCommas[j]);
            }
          } else if(m == 1){
             if(j == 0) {
              varNamesHashMap.put("leftScore", splitByCommas[j]);
            } else if(j == 1) {
              varNamesHashMap.put("leftScoreX", splitByCommas[j]);
            } else if(j == 2) {
              varNamesHashMap.put("scoreY", splitByCommas[j]);
            }
          } else if(m == 2){
             if(j == 0) {
              varNamesHashMap.put("rightScore", splitByCommas[j]);
            } else if(j == 1) {
              varNamesHashMap.put("rightScoreX", splitByCommas[j]);
            }
          }
          j++;
        }
        max = max + j;
      }
    }
    catch (Exception e) 
    {
      // println("Couldn't check scores");
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
  
      //int i = 0;
      //for(int m = 0; m < ellipses.size(); m++) 
      //{
      //  splitByLeftBrace = splitTokens(linesFiltered.get(ellipses.get(m)), "(");
      //  splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));

      //  i = 0;
      //  while (i < splitByCommas.length && i < 4) //get ellipse's parameters
      //  {           
          
      //    if(i == 0) {
      //      varNamesHashMap.put("ballX", "-99");
      //    } else if(i == 1) {
      //      varNamesHashMap.put("ballY", "-99");
      //    } else if(i == 2) {
      //      varNamesHashMap.put("diameter", "-99");
      //    }
          
      //    i++;
      //  }
      //  max = max + i;
      //}
      
      int j = 0;
      max = 0;
      for(int m = 0; m < ellipses.size(); m++) 
      {
        splitByLeftBrace = splitTokens(linesFiltered.get(ellipses.get(m)), "(");
        splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));

        j = 0;
        while (j < splitByCommas.length && j < 4) //get ellipse's parameters
        {           
          
          if(j == 0) {
            varNamesHashMap.put("ballX", splitByCommas[j]);
          } else if(j == 1) {
            varNamesHashMap.put("ballY", splitByCommas[j]);
          } else if(j == 2) {
            varNamesHashMap.put("diameter", splitByCommas[j]);
          }
          
          j++;
        }
        max = max + j;
      }
    }
    catch (Exception e) 
    {
      // println("Couldnt Check ellipses");
    }
  }

  void getSpeeds() 
  {  
    try
    {
      
      String speedVar="xs";
      String pattern = "[a-zA-Z0-9 ]+=[a-zA-Z0-9 ]+[+-][a-zA-Z0-9 ]+;";

      /* Matches an updating assignment statement eg. a = a + b;*/
      for(int m = 0; m < linesFiltered.size(); m++)
      {
        String line = linesFiltered.get(m);
        
        
        if( match(line, pattern) != null ) // Finds a match
        {  
          String[] lineAfterSplit = splitTokens(line, "+-=; "); //Remove operations and semicolon
          String leftHandVar = lineAfterSplit[0];
          String rightVarBeforeOperation = lineAfterSplit[1];
          String rightVarAfterOperation = lineAfterSplit[2];
          boolean isUpdatingBallX = leftHandVar.equals(varNamesHashMap.get("ballX"));
          boolean isUpdatingBallY = leftHandVar.equals(varNamesHashMap.get("ballY"));
          boolean isBallPosVar = isUpdatingBallX || isUpdatingBallY;
          /*  
            If the pattern is a = a + b, Check if a corresponds to a BALL position variable and not PADDLE position variable
            Then, we can safely take b as the speed of the ball.
          */ 
          if( isBallPosVar && leftHandVar.equals(rightVarBeforeOperation) )
          {
              // The speed var is on the left. eg 'a = a + b', where b is speed
              speedVar = rightVarAfterOperation;
              if( isUpdatingBallX ) varNamesHashMap.put("ballXSpeed", speedVar);
              else if( isUpdatingBallY ) varNamesHashMap.put("ballYSpeed",speedVar);
               
          }else if(isBallPosVar && leftHandVar.equals(rightVarAfterOperation) )
          {
              // The speed var is on the right. eg 'a = b + a', where b is speed
              speedVar = rightVarBeforeOperation;
              if( isUpdatingBallX ) varNamesHashMap.put("ballXSpeed", speedVar);
              else if( isUpdatingBallY ) varNamesHashMap.put("ballYSpeed",speedVar);
             
          }
        }
      }
    }
    catch(Exception e)
    {
      println("May not have gotten all speed vars: " + e);
    }
  }

   void getGameOn() 
  {
    try
    {
      
      for (int m = 0; m < linesFiltered.size(); m++) 
      {         
        String[] splitMatch;
        // Edited to match both declarations and initialisations.
        if(match(linesFiltered.get(m), "^boolean.*$") != null) {
          
          splitMatch = trim(splitTokens(linesFiltered.get(m), "=; "));
          
          String gameOnVar = trim(splitMatch[1]);
          varNamesHashMap.put("gameOn", gameOnVar);
        }
      }
    }
    catch(Exception e)
    {
      //varNamesHashMap.put("gameOn", "gOn");
      println("couldnt get boolean vars" + e);
    }
  }
  
  void getVariables() 
  { 
    String[] splitByEquals;
    String[] splitBySemiColon;
    String[] splitBySpace;
    
    try
    {
      for(int i = 0; i < linesFiltered.size(); i++)
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
        
        if(isNumeric(varValue)) {
           variablesHashMap.put(varName, varValue); 
           varKeys.add(varName);
        } else {
          //// println("The value for the variable " + varName + " is not a number");
        }
 
      }
      //Add wierd to variables.
      variablesHashMap.put("wierd","-99");
      varKeys.add("wierd"); 
    }
    catch(Exception e)
    {
      println("Could not get variables"); 
    }
  }
  
  void createFile() {
    try
    {
      output.println("class Code {");
      int setupFlag = 0;
      int drawFlag = 0;
      
      for (int i = 0; i < fileLines.length; i++)
      {
        if (match(fileLines[i], "fullScreen") != null) {
            output.println("  //" + fileLines[i]);
        } else if (match(fileLines[i], "void") != null) {

          if ((match(fileLines[i], "setup") != null) && (match(fileLines[i], "\\{") != null)) {
            output.println("void once() {");
            setupFlag ++;
          } else if (match(fileLines[i], "setup") != null) {
            output.println("void once()");
            setupFlag ++;
          }
          
          
          if ((match(fileLines[i], "draw") != null) && (match(fileLines[i], "\\{") != null)) {
            output.println("void forever() {");
            drawFlag ++;
          } else if (match(fileLines[i], "draw") != null) {
            output.println("void forever()");
            drawFlag ++;
          } 
          
        } else {
          output.println(trim(fileLines[i]));
        }
      }
      
      if(setupFlag == 0 ){
        output.println("void once(){}");
      }
      if(drawFlag == 0){
        output.println("void forever(){}");
      }

      
      output.println("int wierd = -99;");
      
      createGetters();
      
      //output.println("}");
      //output.flush(); // Writes the remaining data to the file
      //output.close(); // Finishes the file
   
      createSetters();
      
      output.println("}");

      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
    }
    catch(Exception e)
    {
      // println("couldnt create file " + e);
    }
  }
  
  void createGetters()
  {
    //getters
      for (Map.Entry<String,String> entry : varNamesHashMap.entrySet())
      { 
        if(entry.getKey() == "gameOn"){
          String value = entry.getValue();
          if(entry.getValue() == "wierd"){
            value = entry.getKey();
            output.println("boolean "+ entry.getKey() + " = " + "false" + ";");
          }     
            output.println("boolean " + entry.getKey() + "()");
            output.println("{");
            output.println("return " + value + ";");
            output.println("}");
       
        }else if( !(entry.getValue().contains("\"")) && !(isNumeric(entry.getValue())) ){
          output.println("int " + entry.getKey() + "()");
          output.println("{");
          output.println("  return int(" + entry.getValue() + ");");
          output.println("}");
        }else{
          //add missing/magic number variable
          variablesHashMap.put(entry.getKey(), entry.getValue() );
          
          output.println("int "+ entry.getKey() + " = " + int(entry.getValue()) + ";");
          
          //Print new setter for missing
          output.println("int " + entry.getKey() + "()");
          output.println("{");
          output.println("  return int(" + entry.getKey() + ");");
          output.println("}");         
        }
        
      }
  }
  
  void createSetters()
  {
    //write setters"
      for (Map.Entry<String,String> entry : varNamesHashMap.entrySet())
      { 
        if(entry.getKey() == "gameOn"){
          String value = entry.getValue();
          if(entry.getValue() == "wierd"){
            value = entry.getKey();
          }
          output.println("void " + "set" + entry.getKey() + "(boolean x)");
          output.println("{");
          output.println("  "+ value + " = x" + ";");
          output.println("}");
        }else if( !entry.getValue().contains("\"") && !(isNumeric(entry.getValue())) ){
            // || true
            output.println("void " + "set" + entry.getKey() + "(int x)");
            output.println("{");
            output.println("  "+entry.getValue() + " = x" + ";");
            output.println("}");
         }
         else{
            //Create the setter properly
            output.println("void " + "set" + entry.getKey() + "(int x)");
            output.println("{");
            output.println("  "+ entry.getKey()+ " = x" + ";");
            output.println("}");
            
            //add setter to map
            varNamesHashMap.put(entry.getKey(), entry.getKey()); 
           }
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
  
  void checkScore()
  {
    ArrayList<Integer> yvals = new ArrayList<Integer>();
    ArrayList<Integer> xvals = new ArrayList<Integer>();
    ArrayList<String> stryvals = new ArrayList<String>();
    ArrayList<String> strscores = new ArrayList<String>();
    ArrayList<String> scorevals = new ArrayList<String>();
    int magicFlag = 0;
    String leftScoreX = "0", 
    leftScoreY = "0", 
    leftScore = "0", 
    rightScore = "0", 
    rightScoreX = "0", scoreY = "0";
    
    for(int i = 0; i < linesFiltered.size(); i++)
    {
        String thisLine = linesFiltered.get(i);
        if( match( thisLine, "^textSize.*$") != null && thisLine.contains("("))
        {  
          // Get matches for textSize()
          String[] a = splitTokens(thisLine, "()//;");  
          varNamesHashMap.put("textsize", a[1]);
        }
        if( match(thisLine, "^text.*$") != null // This has text()
          && match(thisLine, "^textSize.*$") == null // This is not textSize()
          && !thisLine.contains("=")) // This is not an assignment to be sure.
        {
          // Get matches for only text()
         
          String[] splitBy = splitTokens(thisLine, "(),//; ");
          
          String scorey = splitBy[3]; 
          String scorex = splitBy[2]; 
          String score = splitBy[1]; 
          if( splitBy[1].contains("\"")  )
          {
            magicFlag = 1;
            yvals.add(int(scorey));
            xvals.add(int(scorex));
            scorevals.add(score);
          }else{   
            stryvals.add(scorey);
            xvals.add(int(variablesHashMap.get(scorex)));    
            scorevals.add(scorex);
            strscores.add(score);
           }
          
        }
        
    }
  
    if(magicFlag == 1){
      try
      {
        leftScoreX = str(Collections.min(xvals));
        int leftScoreXIndex = xvals.indexOf(leftScoreX);
        rightScoreX = str(Collections.max(xvals));
        int rightScoreXIndex = xvals.indexOf(rightScoreX);
        scoreY = "leftScore";//yvals.get(leftScoreXIndex));
        leftScore = scorevals.get(leftScoreXIndex);
        rightScore = scorevals.get(rightScoreXIndex);
        
        varNamesHashMap.put("leftScoreX", leftScoreX  );
        varNamesHashMap.put("rightScoreX", rightScoreX );
        varNamesHashMap.put("scoreY", scoreY );
        varNamesHashMap.put("leftScore", leftScore );
        varNamesHashMap.put("rightScore", rightScore );
      }catch(Exception e){
        // Weird values for text() eg. text("4    2", textX, textY);
          varNamesHashMap.put("leftScoreX", leftScoreX  );
          varNamesHashMap.put("rightScoreX", rightScoreX );
          varNamesHashMap.put("leftScore", leftScore );
          varNamesHashMap.put("rightScore", rightScore );
          varNamesHashMap.put("scoreY", scoreY );
      }
             
    }else{
      try{
        int leftScoreXIndex = xvals.indexOf(Collections.min(xvals));
        int rightScoreXIndex = xvals.indexOf(Collections.max(xvals));
        
        leftScoreX = scorevals.get(leftScoreXIndex);
        leftScore = strscores.get(leftScoreXIndex);
        rightScoreX = scorevals.get(rightScoreXIndex);
        rightScore = strscores.get(rightScoreXIndex);
        scoreY = stryvals.get(leftScoreXIndex); 
      }
      catch(Exception e){
        getScreenSize();
        leftScoreX =  str((screenWidth / 4));
        rightScoreX =  str((3 * screenWidth) / 4);
      }
      
      varNamesHashMap.put("leftScoreX", leftScoreX  );
      varNamesHashMap.put("rightScoreX", rightScoreX );
      varNamesHashMap.put("leftScore", leftScore );
      varNamesHashMap.put("rightScore", rightScore );
      varNamesHashMap.put("scoreY", scoreY );
      
    }
   
  }
  
  
  void run() {
     presetValues();
     getLines();
     removeEmptyLines();
     getVariables();
     checkEllipses();
     checkRects();
     checkScore();
     //checkScores(); //replaced in favour of checkScore
     getGameOn();
     getSpeeds();
     createFile();
     //println(varNamesHashMap);
  }

}
