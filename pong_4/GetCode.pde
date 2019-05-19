import java.util.Map;

class GetCode {
  
  PrintWriter output = createWriter("Code.pde");
  
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
    
  GetCode() { //empty constructor for class
  }

  /*
  In the function below, I'm reading the file into an array of strings. Each element in the array is a line in the file
   */
  void getLines() { //reads file
    try
    {
      fileLines = loadStrings("assignment3/assignment3.pde"); //comment if you're using APDE
    }
    catch (Exception e) //IO error
    {
      println("Couldn't load file");
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
        println("Improper code grouping");
        
      }
    }
    catch (Exception e) //catch exception
    {
      println("Couldn't remove empty lines in file");
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
      String[] splitByLeftBrace1;
      String[] splitByCommas1;
      int max = 0;      
      
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
      println("Couldn't check rects");
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
            println("size not set before text called");
          }
        }
        if (match(linesFiltered.get(i), "^text.*$") != null) //look for text with regex
        {
          texts.add(i);
        }
      }

      if (sizeFlag) //if no textSize was used
      {
        println("text size not set");
      }
      
      int j = 0;
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
      println("Couldn't check scores");
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
  
      int j = 0;
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
      println("Couldnt Check ellipses");
    }
  }
   void getGameOn() 
  {
    try
    {
      String[] splitBySemiColon;
      String[] splitBySpace;
      
      for (int m = 0; m < linesFiltered.size(); m++) 
      {         
        if(match(linesFiltered.get(m), "boolean") != null) {
          
          splitBySemiColon = trim(splitTokens(linesFiltered.get(m), ";"));
          
          splitBySpace = trim(splitTokens(splitBySemiColon[0], " "));
          
          varNamesHashMap.put("gameOn", trim(splitBySpace[1]));
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
          //println("The value for the variable " + varName + " is not a number");
        }
      }
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
        if (match(fileLines[i], "size\\(") != null) {
          String[] tokens = trim(splitTokens(fileLines[i], "//"));
          if (match(tokens[0], "size") != null) {
            output.println("//" + tokens[0]);
          } else {
            output.println(tokens[0] + "  //" + tokens[1]);
          }
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
      
      //hasmap name gfg
      for (Map.Entry<String,String> entry : varNamesHashMap.entrySet())
      {  
        output.println("int " + entry.getKey() + "()");
        output.println("{");
        output.println("return int(" + entry.getValue() + ");");
        output.println("}");
      }
      
      output.println("}");

      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
    }
    catch(Exception e)
    {
      println("couldnt create file " + e);
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
    removeEmptyLines();
    getVariables();
    checkEllipses();
    checkRects();
    checkScores();
    getGameOn();
    createFile();
  }
}
