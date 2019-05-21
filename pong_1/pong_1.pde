//Assignment 1: Make Pong Interface
//This program grades assignment 1
//ArrayList<String> groups = new ArrayList<String>(); // Stores names of Suaode Africa Groups, 1,2&3

void setup ()
{
  if (args != null) {
    //println(args.length);
    //for (int i = 0; i < args.length; i++) {
    //  println(args[i]);
    //}
    
    File f = new File(sketchPath() + "/../" + args[0]);
    Test tests = new Test(f);
    tests.run();
  } else {
    println("args == null");
  }
  
  // set the path to the where the python code will  put the downloaded codes
  //String path = sketchPath() + "/../assets/";

  //Get group folder names ie
  //Suacode Africa 1,  Suacode Africa 2 & Suacode Africa 3
  //File[] files = listFiles(path + "code/");
  //for (int i = 0; i < files.length; i++) {
  //  File f = files[i];
  //  if (f.isDirectory())
  //  {
  //    groups.add(f.getName());
  //  }
  //}
  
  /* This block doeas a number of things
   for each group:
   1. Get student names from dirs
   2. get first file
   4, grade the flies
   */

  //int k = 0;
  //while (k < groups.size())
  //{
  //  ArrayList<String> studentNames = new ArrayList<String>(); // stores list of stident names in each group
  //  java.util.List<File> codes = new ArrayList<File>(); // stores files to be graded
  //  //ArrayList<String> emailAddresses = new ArrayList<String>(); //Stores email addresses
  //  HashMap<String,String> emailAddresses = new HashMap<String,String>();
  //  HashMap<String,String> ids = new HashMap<String,String>();
    
  //  //get dirs with students names
  //  String url = path + "code/" + groups.get(k) + "/Assignment 1" ;
  //  File[] names = listFiles(url);
  //  for (int i = 0; i < names.length; i++) {
  //    File f = names[i];
  //    if (f.isDirectory())
  //    {
  //      studentNames.add(f.getName());
  //    }
  //  } 
    
  //  //Get the first file
  //  for (int i = 0; i < studentNames.size(); i++) {
  //    String address = path + "code/" + groups.get(k) + "/Assignment 1/" + studentNames.get(i);      
  //    String codeFile = listFileNames(address)[0];
  //    File code = new File(address + "/" + codeFile);
  //    codes.add(code);
  //  }
    
  //  //Math student names to their email addresses
  //  String[] idLines = loadStrings(path + "id-lists/" + groups.get(k) + ".csv");
  //  print(path + "id-lists/" + groups.get(k) + ".csv");
  //  for(int m = 0; m < studentNames.size(); m++) 
  //  {
  //    for (int n = 0; n < idLines.length; n++) {
  //      String[] parts = trim(splitTokens(idLines[n], ","));
  //      String name = parts[0];
  //      if(name.equals(studentNames.get(m)))
  //      {  
  //        ids.put(name, parts[1]);
  //      }
  //    }
  //  }
    
  //  //Match student names to their email addreses
  //  String[] lines = loadStrings(path + "email-lists/" + groups.get(k) + ".csv");
  //  for(int m = 0; m < studentNames.size(); m++) 
  //  {
  //    for (int n = 0; n < lines.length; n++) {
  //      String[] parts = trim(splitTokens(lines[n], ","));
        
  //      if(parts.length > 2) {
  //        String name = parts[1] + " " + parts[0];
  //        if(name.equals(studentNames.get(m)))
  //        {  
  //          emailAddresses.put(name, parts[2]);
  //        }
  //      } else if(parts.length == 2) {
  //        String name = parts[0];
  //        if(name.equals(studentNames.get(m)))
  //        {
  //          emailAddresses.put(name, parts[1]);
  //        }
  //      }
  //    }
  //  }
    
  //  Test[] tests = new Test[codes.size()];
    
  //  for (int i = 0; i < codes.size(); i++) {
  //    String[] details = new String[4];
      
  //    details[0] = studentNames.get(i);
  //    details[1] = ids.get(studentNames.get(i));
  //    details[2] = emailAddresses.get(studentNames.get(i));
  //    details[3] = groups.get(k);
      
  //    tests[i] = new Test(codes.get(i), details);
  //    tests[i].run();
  //  }
  //  k++;
  //}
  noLoop(); // draw doesn't have to run
  exit(); // quit the program
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
