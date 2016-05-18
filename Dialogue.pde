int last=0;
Button butt = new Button(443,350+15,"Submit as this level");
Button b3 = new Button(20,20,"X");
Button b1 =new Button(400,20,"<");
Button b4 = new Button(600,20,">");
class Dialogue
{
  String text,path="Level",end=".txt";
  float w;
  int level,t=0;
  float speed=4.3;
  boolean close=true;
  Dialogue(String text1)
  {
    text=text1;
  }
  void display()
  {
    butt.display();
    b3.display();
    b1.display();
    b4.display();
    if (b1.press==true)
    {
      speed-=.1;
    }
    if (b4.press==true)
    {
      speed+=.1;
    }
    fill(255);
    text(speed,490,33);
    if (b3.press==true)
    {
      close=true;
    }
    if (butt.press==true)
    {
      if (level<=30 && level>=1)
      {
        fill(255,0,0);
        textSize(30);
        text("Submitting as level "+level , width/2-200 , 500);
        textSize(11);
        String path="level",end=".txt",temp="";
        PrintWriter output;
        temp=path+str(level)+end;
        output = createWriter(temp);
        output.println("0,230,1,1");
        output.println("S"+speed);
        float maxX=0;
        for (int p=0;p<blocks.size();p++)
        {
          Block t = blocks.get(p);
          if (t.x>maxX)
          maxX=t.x;
          output.println(t.x + "," + t.y + "," +t.w2 + "," +t.h2);
        }
        output.println("E"+maxX);
        output.flush();
        output.close();
        close=true;
      }
      else
      {
        level=0;
        t=1;
      }
    }
    if (t>0)
    t++;
    if (t>0 && t<60)
    {
      
      fill(255,0,0);
      textSize(30);
      text("Enter a number between 1 and 30!!" , width/2-200 , 500);
      textSize(11);
    }
    else if (t>=60)
    {
      
      t=0;
    }
    String temp=text+"  " +level;
    w=textWidth(temp)+8;
    noStroke();
    fill(0,100);
    rect(0,0,width,height);
    fill(150);
    rect(width/2-w/2,height/2,w,14,4);
    fill(255);
    text(temp,width/2-w/2+4,height/2+10);
    int a=0;
    if (keyReleased==true)
    {
      if (key!=BACKSPACE && key!=CODED)
      {
      String k = str(key);
      a=int(k);
      last=a;
      level=level*10+a;
      }
      if (key==BACKSPACE)
      {
        level-=last;
        level/=10;
      }
    }
    
  }
}