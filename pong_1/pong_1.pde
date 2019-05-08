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
    for each group:
    1. Get student names from dirs
    2. get first file
    4, grade the flies
  */
  int k = 0;
  while(k < groups.size())
  {
    ArrayList<String> studentNames = new ArrayList<String>(); // stores list of stident names in each group
    ArrayList<String> studentFiles = new ArrayList<String>(); // stores list of student's codes
    java.util.List<File> codes = new ArrayList<File>(); // stores files to be graded

    //get dirs with students names
    String url = path + groups.get(k) + "\\Assignment 1" ;
    File[] names = listFiles(url);
    for (int i = 0; i < names.length; i++) {
      File f = names[i];
      if (f.isDirectory())
      {
        studentNames.add(f.getName());
      }
    }
    
    //Get the first file
    for (int i = 0; i < studentNames.size(); i++) {
      String address = path + "\\" + groups.get(k) + "\\Assignment 1\\" + studentNames.get(i) + "\\1.pde";
      File code = new File(address);
      codes.add(code);
    }

    Test[] tests = new Test[codes.size() ];
    
    for (int i = 0; i < codes.size(); i++) {
      tests[i] = new Test(codes.get(i), studentNames.get(i), k+1);
      tests[i].run();
    }
    k++;
  }
  // noLoop(); // draw doesn't have to run
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
