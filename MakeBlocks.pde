class MakeBlocks
{
  BufferedReader br;
  String base = "level",end=".txt",path="";
  int level;
  MakeBlocks()
  {
    
  }
  void retrive(String level1)
  {
    if (level!=int(level1))
    {
      level=int(level1);
      path=base+str(level)+end;
      br= createReader(path);
      String line=" ";
      while (line!=null)
      {
        try
        {
          line=br.readLine();
        }
        catch (IOException e)
        {
          line=null;
        }
        if (line==null)
        {
          //line=null;
        }
        else
        {
         if (line.charAt(0)=='E')
         {
           String line1=line.substring(0);
           levelEnd=float(line1);
         }
         else if (line.charAt(0)=='S')
         {
         }
         else
         {
           String coord[] = split(line,",");
           Block temp = new Block(float(coord[0]),float(coord[1]),int(coord[2]),int(coord[3]));
           blocks.add(temp);
         }
        }
      }
      
    }
  }
  
}