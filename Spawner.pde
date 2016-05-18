int count=5;
class Spawner
{
  Block b1 = new Block(true,10,640,1,1);
  Spawner()
  {
  }
  void display()
  {
    noStroke();
    fill(0);
    rect(0,height-70,width,height-70);
    b1.display();
    b2.display();
    stroke(255);
    line(0,height-70,width,height-70);
    line(70,height-70,70,height);
    //do stuff special scanner I dare you
    //move view
    
    //triangle 1
    noStroke();
    if (mouseX>width-50 && mouseX<width-20 && mouseY>height/2-40 && mouseY<height/2+40)
    fill(125,200);
    else
    fill(150);
    triangle(width-50,height/2-40,width-50,height/2+40,width-20,height/2);
    if (mouseX>width-50 && mouseX<width-20 && mouseY>height/2-40 && mouseY<height/2+40 && mousePressed==true && b2.selected==false)
    {
      cameraX+=count;
      count++;
    }
    ///triangle 2
    if (mouseX<50 && mouseX>20 && mouseY>height/2-40 && mouseY<height/2+40)
    fill(125,200);
    else
    fill(150);
    triangle(50,height/2-40,50,height/2+40,20,height/2);
    if (mouseX<50 && mouseX>20 && mouseY>height/2-40 && mouseY<height/2+40 && mousePressed==true && b2.selected==false && cameraX>0)
    {
      cameraX-=count;
      count++;
    }
    if (release==true)
    {
      count=5;
    }
    int a=0;
    while (a<blocks.size())
    {
      Block temp= blocks.get(a);
      temp.display();
      if (temp.over==true && pressed==true)
      {
        pressed=false;
        b2.x=worldX(temp.x);
        b2.y=temp.y;
        b2.selected=true;
        blocks.remove(a);
      }
      a++;
    }
    if (b2.selected==true)
    {
      int b=0;
      while (b<blocks.size())
      {
        Block temp= blocks.get(b);
        //making lines to help out alignment
        if (abs(worldX(temp.x)-b2.x)<=400)
        {
          stroke(250,250,0,50);
          if (temp.y==b2.y)
          line(worldX(temp.left)+temp.w/2,temp.top+temp.h/2,b2.left+temp.w/2,b2.top+temp.h/2);
          if (temp.x==b2.x)
          line(worldX(temp.left)+temp.w/2,temp.top+temp.h/2,b2.left+temp.w/2,b2.top+temp.h/2);
        }
        b++;
      }
    }
    if (b2.x!=10 && b2.y!=640 && release==true)
    {
      int c=0;
      while (c<blocks.size())
      {
        Block temp = blocks.get(c);
        if (b2.bottom<=height-70 && toWorldX(b2.x)==temp.right && b2.y== temp.y && b2.h==temp.h)
        {
         Block t= new Block(temp.x,temp.y,int(temp.w2+1),int(temp.h2));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (toWorldX(b2.right)==temp.x && b2.y==temp.y && b2.h==temp.h)
        {
         Block t= new Block(toWorldX(b2.x),temp.y,int(temp.w2+1),int(temp.h2));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (b2.top==temp.bottom && toWorldX(b2.x)==temp.x && b2.w==temp.w )
        {
         Block t= new Block(temp.x,temp.y,int(temp.w2),int(temp.h2+1));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        else if (b2.bottom==temp.top && toWorldX(b2.x)==temp.x && b2.w==temp.w)
        {
         Block t= new Block(temp.x,b2.y,int(temp.w2),int(temp.h2+1));
         blocks.add(t);
         blocks.remove(c);
         b2.x=10;
         b2.y=640;
        }
        c++;
      }
      if (b2.bottom<=height-70)
      {
        Block temp = new Block(toWorldX(b2.x),b2.y,int(b2.w2),int(b2.h2));
        blocks.add(temp);
        b2.x=10;
        b2.y=640;
      }
      else
      {
        b2.x=10;
        b2.y=640;
      }
    }
    
  }
}