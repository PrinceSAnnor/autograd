//Assignment 1: Make Pong Interface 
//This program grades assignment 1
ArrayList<String> groups = new ArrayList<String>();
ArrayList<String> studentNames = new ArrayList<String>();
java.util.List<java.io.File> codes = new ArrayList<File>();

//Code code;

void setup ()
{

  //code = new Code();

  try
  {
    //code.once();
    //code.forever();
  }
  catch(Exception e)
  {
    //test.totalScore = 0;
    //println("Code runtime error");
    //exit();
  }

  // Using just the path of this sketch to demonstrate,
  // but you can list any directory you like.
  String path = sketchPath() + "/Codes";

  File[] files = listFiles(path);
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.isDirectory())
    {
      groups.add(f.getName());
    }
  }

  //println(groups);

  String file = path + "\\" + groups.get(0) + "\\Assignment 1\\latest_files.txt";
  String[] fileLines = loadStrings(file);

  for (int i = 0; i < fileLines.length; i++) {
    if (trim(fileLines[i]) != null) {
      String address = path + "\\" + groups.get(0) + "\\Assignment 1\\" + fileLines[i];
      File code = new File(address);
      codes.add(code);
    }
  }
  
  Test[] tests = new Test[codes.size() ];
  
  for (int i = 0; i < codes.size(); i++) {
    tests[i] = new Test(codes.get(i));
    tests[i].run();
  }

  noLoop();
}

void draw()
{
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
