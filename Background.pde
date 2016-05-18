Button button= new Button(900,650,"Submit as Level");
class Background
{
  float r,g,b,rh,gh,bh,rc,gc,bc;
  Background(float r1, float g1, float b1)
  {
    r=r1;
    g=g1;
    b=b1;
    rh=r;
    bh=b;
    gh=g;
    rc=r;
    gc=g;
    bc=b;
  }
  void display()
  {
    if ((r>rc+1 || r<rc-1) || (g>gc+1 || g<gc-1) || (b>bc+1 || b<bc-1))
    {
      float rd=(rc-rh)/120,gd=(gc-gh)/120,bd=(bc-bh)/120;
      r+=rd;g+=gd;b+=bd;
    }
    else
    {
      rh=r;
      gh=g;
      bh=b;
    }
    int a=0;
    float rdec=r/(height/2),gdec=g/(height/2),bdec=b/(height/2);
    float r1=0,g1=0,b1=0;
    strokeWeight(2);
    while (a<height)
    {
      stroke(r1,g1,b1);
      line(0,a,width,a);
      a+=2;
      r1+=rdec;
      g1+=gdec;
      b1+=bdec;
    }
    strokeWeight(1);
  }
  void modulate(float r2,float g2,float b2)
  {
    rh=r;gh=g;bh=b;
    rc=r2;gc=g2;bc=b2;
  }
  
}
boolean d;
Dialogue dialogue = new Dialogue("Type the level number");
void doStuff()
{
  button.display();
  if (button.selected==true)
  {
    d=true;
    dialogue.close=false;
  }
  if (d==true)
  {
    if (dialogue.close==false)
    dialogue.display();
  }
}