import java.util.Map;

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
  This function pre-sets the values of the varNamesHashMap to -99
*/
void presetValues(){
  //varNamesHashMap.put("wierd", "-99");
  varNamesHashMap.put("leftPaddleX", "wierd");
  varNamesHashMap.put("leftPaddleY", "wierd");
  varNamesHashMap.put("paddleWidth", "wierd");
  varNamesHashMap.put("paddleHeight", "wierd");
  varNamesHashMap.put("rightPaddleX", "wierd");
  varNamesHashMap.put("rightPaddleY", "wierd");
  varNamesHashMap.put("txtSize", "wierd");
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



void checkRects() //check rects
  {
    try
    {
      String[] splitByLeftBrace1;
      String[] splitByCommas1;
      int max = 0;      
      
      //int recCounter = 0;//parameter to check if two rectangles (paddles) are used.
      //for (int i = 0; i < linesFiltered.size(); i++) 
      //{
      //  if (match(linesFiltered.get(i), "^rect.*$") != null) //look for rect with regex
      //  {
      //    rects.add(i);
      //    recCounter++;
      //  }
      //}
      
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
   Makes sure two texts are on either side of the screen
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
      
      
      //int i = 0;
      //for(int m = 0; m < texts.size(); m++) 
      //{
      //  splitByLeftBrace = splitTokens(linesFiltered.get(texts.get(m)), "(");
      //  splitByCommas = trim(splitTokens(splitByLeftBrace[1], ",)"));
        
      //  i = 0;
      //  while(i < splitByCommas.length) // 
      //  {
          
      //    if(m == 0) {
      //      if(i == 0) {
      //        varNamesHashMap.put("txtSize", "-99");
      //      }
      //    } else if(m == 1){
      //       if(i == 0) {
      //        varNamesHashMap.put("leftScore", "-99");
      //      } else if(i == 1) {
      //        varNamesHashMap.put("leftScoreX", "-99");
      //      } else if(i == 2) {
      //        varNamesHashMap.put("scoreY", "-99");
      //      }
      //    } else if(m == 2){
      //       if(i == 0) {
      //        varNamesHashMap.put("rightScore", "-99");
      //      } else if(i == 1) {
      //        varNamesHashMap.put("rightScoreX", "-99");
      //      }
      //    }
      //    i++;
      //  }
      //  max = max + i;
      //}
      
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
      println("Couldnt get all speed vars: " + e);
    }
  }

   void getGameOn() 
  {
    try
    {
      // String[] splitBySemiColon;
      // String[] splitBySpace;
      
      //for (int m = 0; m < linesFiltered.size(); m++) 
      //{         
      //  if(match(linesFiltered.get(m), "boolean") != null) {
          
      //    splitBySemiColon = trim(splitTokens(linesFiltered.get(m), ";"));
          
      //    splitBySpace = trim(splitTokens(splitBySemiColon[0], " "));
          
      //    varNamesHashMap.put("gameOn", "-99");
      //  }
      //}
      
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

      for (int i = 0; i < fileLines.length; i++)
      {
        if (match(fileLines[i], "fullScreen") != null) {
            output.println("  //" + fileLines[i]);
        } else if (match(fileLines[i], "void") != null) {

          if ((match(fileLines[i], "setup") != null) && (match(fileLines[i], "\\{") != null)) {
            output.println("void once() {");
          } else if (match(fileLines[i], "setup") != null) {
            output.println("void once()");
          }
          if ((match(fileLines[i], "draw") != null) && (match(fileLines[i], "\\{") != null)) {
            output.println("void forever() {");
          } else if (match(fileLines[i], "draw") != null) {
            output.println("void forever()");
          }
        } else {
          output.println(fileLines[i]);
        }
      }
      
      output.println("int wierd = -99;");
      
      //getters
      for (Map.Entry<String,String> entry : varNamesHashMap.entrySet())
      { 
        if(entry.getKey() == "gameOn"){
          output.println("boolean " + entry.getKey() + "()");
          output.println("{");
          output.println("return " + entry.getValue() + ";");
          output.println("}");
        }else{
          output.println("int " + entry.getKey() + "()");
          output.println("{");
          output.println("return int(" + entry.getValue() + ");");
          output.println("}");
        }
        
      }
      
      //output.println("}");

      //output.flush(); // Writes the remaining data to the file
      //output.close(); // Finishes the file
    
    //write setters"
      for (Map.Entry<String,String> entry : varNamesHashMap.entrySet())
      { 
        if(entry.getKey() == "gameOn"){
          output.println("void " + "set" + entry.getKey() + "(boolean x)");
          output.println("{");
          output.println(entry.getValue() + "= x " + ";");
          output.println("}");
        }else{
          //if(entry.getValue()!= "-99"){
          output.println("void " + "set" + entry.getKey() + "(int x)");
          output.println("{");
          output.println(entry.getValue() + "= x " + ";");
          output.println("}");
          //}else{
          //println("The variable" + entry.getKey() + " was not created.");
          //}
        }
      }
      
      output.println("}");

      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
    }
    catch(Exception e)
    {
      // println("couldnt create file " + e);
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
     presetValues();
     getLines();
     removeEmptyLines();
     getVariables();
     checkEllipses();
     checkRects();
     checkScores();
     getGameOn();
     getSpeeds();
     createFile();

    
  }
}
