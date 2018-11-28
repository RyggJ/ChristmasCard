int br,bg,bb,numFlakes=1000;
snowFlake[] flakes=new snowFlake[numFlakes];

void setup(){
  size(1000,800);
  background(br,bg,bb);
  for (int i=0;i<numFlakes;i++){
    flakes[i]=new snowFlake();
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
