//Assignment 1: Make Pong Interface
//This program grades assignment 1
ArrayList<String> groups = new ArrayList<String>(); // Stores names of Suaode Africa Groups, 1,2&3

void setup ()
{
  // set the path to the where the python code will  put the downloaded codes
  String path = sketchPath() + "\\..\\autograd_py\\";

  //Get group folder names ie
  //Suacode Africa 1,  Suacode Africa 2 & Suacode Africa 3
  File[] files = listFiles(path);
  for (int i = 0; i < files.length; i++) {
    File f = files[i];
    if (f.isDirectory())
    {
      groups.add(f.getName());
    }
  }

  /* This block doeas a number of things
    For each group:
    1. Get the file that contains the list the most recent file edited
    2. Get the addresses (paths) and create file objects for the files going to be graded
    3. Get the name of the student
    4. Grade each file using an array of Test objs
  */
  int k = 0;
  while(k < groups.size()){
    java.util.List<java.io.File> codes = new ArrayList<File>();
    ArrayList<String> studentNames = new ArrayList<String>();

    String file = path + "\\" + groups.get(k) + "\\Assignment 1\\latest_files.txt";
    String[] fileLines = loadStrings(file);

    int j = 0;
    for (int i = 0; i < fileLines.length; i++) {
      if (trim(fileLines[i]) != null) {
        String address = path + "\\" + groups.get(k) + "\\Assignment 1\\" + fileLines[i];
        File code = new File(address);
        codes.add(code);
      }

      while(j < fileLines.length) {
        String[] splitBySlash = trim(splitTokens(fileLines[j], "\\"));
        studentNames.add(splitBySlash[0]);
        j++;
      }
    }

    Test[] tests = new Test[codes.size() ];

    for (int i = 0; i < codes.size(); i++) {
      tests[i] = new Test(codes.get(i), studentNames.get(i), k+1);
      tests[i].run();
    }
    codes.clear();
    studentNames.clear();
    k++;
  }
  noLoop(); // draw doesn't have to run
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
