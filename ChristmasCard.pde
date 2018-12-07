int numFlakes=1000,numSmonks=50;
snowFlake[] flakes=new snowFlake[numFlakes];
smoke[] smonks=new smoke[numSmonks];
snowpile snowp;
house hoe;
double skyR=58;
double skyG=93;
PImage wreath;

void setup() {
  wreath=loadImage("wreath.png");
  size(1000,800);
  background((int)skyR,(int)skyG,(int)skyB); 
 snowp = new snowpile();
 hoe = new house();
  for (int i=0;i<numFlakes;i++){
    flakes[i]=new snowFlake();
  }
  for (int i=0;i<numSmonks;i++){
    smonks[i]=new smoke();
  }
}

void draw(){
  background((int)skyR,(int)skyG,(int)skyB); 
  hoe.showtree();
  hoe.show();
  snowp.show();
  snowp.daynight();
  for (int i=0;i<numFlakes;i++){
    flakes[i].move();
    flakes[i].show();
    if(flakes[i].getYpos()>900||flakes[i].getXpos()>1100||flakes[i].getXpos()<-100){
      flakes[i].restart();
    }
  }
  for(int i=0;i<numSmonks;i++){
    smonks[i].incrementer();
    smonks[i].show();
    if(smonks[i].getTint()<0){
      smonks[i]=new smoke();
    }
  }
}

class snowFlake{
  double xpos,ypos,xvel,yvel;
  int size;
  snowFlake(){
    xpos=Math.random()*1000;
    ypos=Math.random()*100-100;
    xvel=Math.random()*5-2.5;
    yvel=Math.random()*5;
    size=(int)(Math.random()*8)+2;
  }
  void move(){
    xpos+=xvel;
    ypos+=yvel;
  }
  void show(){
    fill(255);
    stroke(255);
    ellipse((int)xpos,(int)ypos,size,size);
  }
  void restart(){
    xpos=Math.random()*1000;
    ypos=Math.random()*100-100;
    xvel=Math.random()*5-2.5;
    yvel=Math.random()*5;
    size=(int)(Math.random()*8)+2;
  }
  double getXpos(){
    return xpos;
  }
  double getYpos(){
    return ypos;
  }
}

class smoke{
  double x=925,y=300,size=10,tint=250,sizeinc,tintinc,xinc,yinc;
  smoke(){
    sizeinc=Math.random()/4;
    tintinc=Math.random()*1.5+.25;
    xinc=Math.random()/2;
    yinc=Math.random()/2;
  }
  void incrementer(){
    x-=xinc;
    y-=yinc;
    size+=sizeinc;
    tint-=tintinc;
  }
  void show(){
    noStroke();
    fill(160,(int)tint);
    ellipse((int)x,(int)y,(int)size,(int)size);
  }
  double getTint(){
    return tint;
  }
}
class snowpile
{
  int snowy=600;
  int x1= -25;
  int y1=150;
  int x2= width+50;
  int y2= 150;
  double x=-50;
  double y=200;
  double angle=-PI/6;
  boolean day=true;
  float bankY=500;
  int time;
  void show(){
   fill(255);
   ///rect(0,snowy,width,200);
   ellipse(500,1000,1000,bankY);
   ellipse(200,1000,1000,bankY);
   ellipse(800,1000,1000,bankY);

  }
  void daynight(){
     noStroke();
    if (day) {
      fill(255, 255, 0);
    } else {
      fill(100);
    }
    ellipse((int)x, (int)y, 75, 75);
    x+=2*cos((float)angle);
    y+=2*sin((float)angle);
    angle+=.00175;
    if (x>width+200) {
      if(day){
        
      }
      x=-50;
      y=200;
      angle=-PI/6;
      day=!day;
      time=0;
    }
    //-------------bank---------------
    fill(255);
   
    if (day) {
      bankY-=(1/7.0);
    } else {
      bankY+=(1/7.0);
    }
    //-------------sky-------------
    if((day&&time<300)||(!day&&time>300)){
      skyR+=(58/300.0);
      skyG+=(93/300.0);
      skyB+=(116/300.0);
    }
    else{
      skyR-=(58/300.0);
      skyG-=(93/300.0);
      skyB-=(116/300.0);
    }
    time++;
  }
   
  }
  

class house{
    void show(){
      fill(101, 67, 33);
      rect(600, 450, 400,400);
      fill(139,69,19);
      rect(825,650,100,150);
      fill(112, 40, 9);
      rect(900,300,50,100);
      fill(157,96,85);
      triangle(550,450,850,350,1150,450);
      fill(0);
      ellipse(850,725,10,10);
      fill(254, 252, 215);
      rect(650,600,100,100);
      fill(0);
      rect(650,650,100,10);
      rect(695,600,10,100);
      image(wreath,815,500);
    }
     void showtree(){
      fill(101, 67, 33);
      rect(200,700,50,100);
      fill(58, 164, 34);
      triangle(100,700,225,500,350,700);
      triangle(110,625,225,400,340,625);
      triangle(120,550,225,350,330,550);
      fill(255,255,0);
      triangle(200,340,225,300,250,340);
      triangle(200,320,225,350,250,320);

    }
  }
