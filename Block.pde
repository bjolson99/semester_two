class Block
{
  float x,y,left,top,right,bottom,w,h,trans=0,overCount=0;
  float offsetX=0,offsetY=0;
  int w2=0,h2=0;
  boolean over=false,special=false,selected=false,kinda=false,fall=true;
  Block(float x1,float y1,float w1,float h1,boolean override)
  {
    if (override==true)
    {
      x=x1;
      y=y1;
      w=w1;
      h=h1;
      left=x;
      top=y;
      right=x+w;
      bottom=y+h;
    }
  }
  Block(float x1, float y1, int w1, int h1)
  {
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
  }
  Block(float x1, float y1,boolean fall1, int w1, int h1)
  {
    fall=fall1;
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
  }
  Block(boolean kinda1,float x1, float y1, int w1, int h1)
  {
    x=x1;
    y=y1;
    w2=w1;
    h2=h1;
    w=w1*50;
    h=h1*50;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    kinda=kinda1;
  }
  Block(float x1, float y1, int w1, int h1,float trans1)
  {
    x=x1;
    y=y1;
    w=w1*50;
    h=h1*50;
    w2=w1;
    h2=h1;
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    trans=trans1;
    special=true;
  }
  void display()
  {
    left=x;
    top=y;
    right=x+w;
    bottom=y+h;
    if (special==false)
    {
    if (toWorldX(mouseX)>left && toWorldX(mouseX)<right && mouseY>top && mouseY<bottom)
    {
      over=true;
    }
    else
    {
      if (selected==false)
      over=false;
    }
    }
    else
    {
    if (mouseX>left && mouseX<right && mouseY>top && mouseY<bottom)
    {
      over=true;
    }
    else
    {
      if (selected==false)
      over=false;
    }
    }
    
    if (over==true)
    overCount++;
    else
    overCount=0;
    if (special==true && selected==true && (offsetX!=0 || offsetY!=0) && over==true)
    {
      x=mouseX-offsetX;
      y=mouseY-offsetY;
      while (toWorldX(x) % 10 !=0)
      {
        x++;
      }
      while (y % 10 !=0)
      {
        y++;
      }
    }
    //////////////////////DRAWING OF BLOCK////////////////
    if (trans==0)
    fill(0);
    else
    fill(0,trans);
    noStroke();
    if (special==false && kinda==false)
    rect(worldX(x)+1,y+1,w-2,h-2);
    else
    rect(x+1,y+1,w-2,h-2);
    noFill();
    if (trans==0)
    stroke(0,0,255);
    else
    stroke(0,0,255,trans);
    if (special==false && kinda==false)
    rect(worldX(x),y,w,h);
    else
    rect(x,y,w,h);
    stroke(0,0,255,100-trans);
    if (special==false && kinda==false)
    rect(worldX(x)-1,y-1,w+2,h+2);
    else
    rect(x-1,y-1,w+2,h+2);
    
    
    //for block select
    
    //special block gets special stuff
    if (special==true)
    {
      if (mousePressed==true && offsetX==0 && offsetY==0 && over==true)
      {
        if (special==false)
        offsetX=toWorldX(mouseX)-x;
        else if(special==true)
        offsetX=(mouseX)-x;
        offsetY=mouseY-y;
        selected=true;
      }
      else if (mousePressed==false || release==true)
      {
        offsetX=0;
        offsetY=0;
        selected=false;
      }
    }
    //no selecting when not pressed
    if (release==true)
    {
      selected=false;
    }
  }
  
  
}