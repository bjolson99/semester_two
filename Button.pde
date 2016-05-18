class Button
{
  float x,y,w,h;
  String text="";
  boolean over,press,selected;
  Button(float x1,float y1,String text1)
  {
    x=x1;
    y=y1;
    text=text1;
    
    h=20;
  }
  void display()
  {
    w=textWidth(text)+8;
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h)
    over=true;
    else
    over=false;
    if (over==true && pressed==true)
    {
      press=true;
      selected=true;
      pressed=false;
    }
    else
    press=false;
    if(release==true)
    selected=false;
    stroke(0,200,200);
    if (over==true)
    fill(100);
    else
    fill(150);
    rect(x,y,w,h,4);
    fill(0);
    text(text,x+4,y+h-5);
  }
   
}