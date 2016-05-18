Background b = new Background(0,100,100);
Spawner s=new Spawner();
ArrayList <Block> blocks = new ArrayList();
boolean release=false,pressed=false,pr=false,keyReleased;
MakeBlocks m = new MakeBlocks();
Block b2= new Block(10,640,1,1,150);
float cameraX=0,camerY=0,p=0,level=13,levelEnd=-500;
void setup()
{
  size(1000,700);
  frameRate(30);
  
}


void draw()
{
  textSize(11);
  b.display();
  //if (frameCount==1)
  //m.retrive(str(level));
  s.display();
  doStuff();
  released();
}

void released()
{
  if (mousePressed==false)
  {
    p=0;
  }
  else
  {
    if (p==0)
    pressed=true;
    else
    pressed=false;
    p=1;
  }
  release=false;
  keyReleased=false;
}

void mouseReleased()
{
  release=true;
  p=0;
}

void keyReleased()
{
  keyReleased=true;
}




float worldX(float x)
{
  x-=cameraX;
  return x;
}

float toWorldX(float x)
{
  x+=cameraX;
  return x;
}