int numFlakes=800, numSmonks=50;
snowFlake[] flakes=new snowFlake[numFlakes];
smoke[] smonks=new smoke[numSmonks];
snowpile snowp;
house hoe;
int r=85;
int g=156;
int b=200;

void setup() {
  size(1000, 800);
  background(r, g, b); 
  snowp = new snowpile();
  hoe = new house();
  for (int i=0; i<numFlakes; i++) {
    flakes[i]=new snowFlake();
  }
  for (int i=0; i<numSmonks; i++) {
    smonks[i]=new smoke();
  }
}

void draw() {
  background(r, g, b);
  for (int i=0; i<numSmonks; i++) {
    smonks[i].incrementer();
    smonks[i].show();
    if (smonks[i].getTint()<0) {
      smonks[i]=new smoke();
    }
  }
  hoe.show();
  snowp.show();
  snowp.daynight();
  for (int i=0; i<numFlakes; i++) {
    flakes[i].move();
    flakes[i].show();
    if (flakes[i].getYpos()>900||flakes[i].getXpos()>1100||flakes[i].getXpos()<-100) {
      flakes[i].restart();
    }
  }
  /*for (int i=0; i<numSmonks; i++) {
   smonks[i].incrementer();
   smonks[i].show();
   if (smonks[i].getTint()<0) {
   smonks[i]=new smoke();
   }
   }*/
}

class snowFlake {
  double xpos, ypos, xvel, yvel;
  int size;
  snowFlake() {
    xpos=Math.random()*1000;
    ypos=Math.random()*100-100;
    xvel=Math.random()*5-2.5;
    yvel=Math.random()*5;
    size=(int)(Math.random()*8)+2;
  }
  void move() {
    xpos+=xvel;
    ypos+=yvel;
  }
  void show() {
    fill(255);
    stroke(255);
    ellipse((int)xpos, (int)ypos, size, size);
  }
  void restart() {
    xpos=Math.random()*1000;
    ypos=Math.random()*100-100;
    xvel=Math.random()*5-2.5;
    yvel=Math.random()*5;
    size=(int)(Math.random()*8)+2;
  }
  double getXpos() {
    return xpos;
  }
  double getYpos() {
    return ypos;
  }
}

class smoke {
  double x=925, y=250, size=10, tint=250, sizeinc, tintinc, xinc, yinc;
  int shade=(int)(Math.random()*50)+75;
  smoke() {
    sizeinc=Math.random()/4;
    tintinc=Math.random()*1.5+.25;
    xinc=Math.random()/4;
    yinc=Math.random()/2;
  }
  void incrementer() {
    x-=xinc;
    y-=yinc;
    size+=sizeinc;
    tint-=tintinc;
  }
  void show() {
    noStroke();
    fill(shade, (int)tint);
    ellipse((int)x, (int)y, (int)size, (int)size);
  }
  double getTint() {
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
  double bankY=700;
  int time;
  void show() {
    //fill(255);
    //rect(0, snowy, width, 200);
  }
  void daynight() {
    /*if (x1<width/2) {
     fill(255, 255, 0);
     ellipse(x1, y1, 50, 50);
     x1+=5;
     y1-=1;
     snowy+=1;
     r+=1;
     g+=1;
     b+=1;
     } else if (x1>=width/2&&x1<width) {
     fill(255, 255, 0);
     ellipse(x1, y1, 50, 50);
     x1+=5;
     y1+=1;
     snowy+=1;
     r-=2;
     g-=1;
     b-=1;
     } else if (x1>=width&&x1<width+20) {
     x2=-25;
     x1=width+40;
     y2=150;
     }
     if (x2<width/2) {
     fill(254, 252, 215);
     ellipse(x2, y2, 50, 50);
     x2+=5;
     y2-=1;
     snowy-=1;
     r-=1;
     g-=1;
     b-=1;
     } else if (x2>=width/2&&x2<width) {
     fill(254, 252, 215);
     ellipse(x2, y2, 50, 50);
     x2+=5;
     y2+=1;
     snowy-=1;
     r+=1;
     g+=1;
     b+=1;
     } else if (x2>=width&&x2<width+20) {
     x1=-25;
     x2=width+40;
     y1=150;
     }*/
    //--------------sun----------------
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
        bankY=800;
      }
      x=-50;
      y=200;
      angle=-PI/6;
      day=!day;
    }
    if (day) {
      time++;
    } else {
      time--;
    }
    //-------------bank---------------
    fill(255);
    rect(0, (int)bankY, width, 100);
    if (day) {
      bankY+=(1/7.0);
    } else {
      bankY-=(1/7.0);
    }
  }
}
class house {
  void show() {
    fill(101, 67, 33);
    rect(600, 400, 400, 400);
    fill(139, 69, 19);
    rect(825, 650, 100, 150);
    fill(145, 142, 133);
    rect(900, 250, 50, 100);
    fill(0);
    triangle(550, 400, 850, 300, 1150, 400);
    ellipse(850, 725, 10, 10);
  }
}
