snowpile snowp;
house hoe;
int r=85;
int g=156;
int b=200;
void setup(){
  size(1000,800);
 background(r,g,b); 
 snowp = new snowpile();
 hoe = new house(); 
  
}
void draw(){
  background(r,g,b);
  hoe.show();
  snowp.show();
  snowp.daynight();
}

class snowpile
{
  int snowy=600;
  int x1= -25;
  int y1=150;
  int x2= width+50;
  int y2= 150;
  void show(){
   fill(255);
   rect(0,snowy,width,200);
  }
  void daynight(){
   if(x1<width/2){
    fill(255,255,0);
   ellipse(x1,y1,50,50);
   x1+=5;
   y1-=1;
   snowy+=1;
   r+=1;
   g+=1;
   b+=1;
   }
   else if(x1>=width/2&&x1<width){
     fill(255,255,0);
   ellipse(x1,y1,50,50);
   x1+=5;
   y1+=1;
   snowy+=1;
   r-=2;
   g-=1;
   b-=1;
   }
   else if(x1>=width&&x1<width+20){
     x2=-25;
     x1=width+40;
     y2=150;
   }
      if(x2<width/2){
    fill(254, 252, 215);
   ellipse(x2,y2,50,50);
   x2+=5;
   y2-=1;
   snowy-=1;
   r-=1;
   g-=1;
   b-=1;
   }
   else if(x2>=width/2&&x2<width){
     fill(254, 252, 215);
   ellipse(x2,y2,50,50);
   x2+=5;
   y2+=1;
   snowy-=1;
   r+=1;
   g+=1;
   b+=1;
   }
   else if(x2>=width&&x2<width+20){
     x1=-25;
     x2=width+40;
     y1=150;
   }  
  }
  
}
class house{
    void show(){
      fill(101, 67, 33);
      rect(600, 400, 400,400);
      fill(139,69,19);
      rect(825,650,100,150);
      fill(145, 142, 133);
      rect(900,250,50,100);
      fill(0);
      triangle(550,400,850,300,1150,400);
      ellipse(850,725,10,10);
     
    }
  }
