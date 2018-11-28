int br,bg,bb,numFlakes=1000,numSmonks=50;
snowFlake[] flakes=new snowFlake[numFlakes];
smoke[] smonks=new smoke[numSmonks];

void setup(){
  size(1000,800);
  background(br,bg,bb);
  for (int i=0;i<numFlakes;i++){
    flakes[i]=new snowFlake();
  }
  for (int i=0;i<numSmonks;i++){
    smonks[i]=new smoke();
  }
}

void draw(){
  background(0);
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
  double x=925,y=250,size=10,tint=250,sizeinc,tintinc,xinc,yinc;
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
