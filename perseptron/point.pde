float f(float x){
  return 0.6 * x +0.3;
}

class Point{

  float x,y;
  int label;
  float bias=1;
  
  Point(float tx,float ty){
    x=tx;
    y=ty;
    float lineY=f(x);
  
    if(x>lineY){
      label=1;
    }else{
      label=-1;
    }
  }
  
  Point(){
    x=random(-1,1);
    y=random(-1,1);
    float lineY=f(x);
    if(y>lineY){
      label=1;
    }else{
      label=-1;
    }
  }
  
  float getX(){
    return map(x,-1,1,0,width);
  }
  
  float getY(){
    return map(y,-1,1,height,0);
  }
  
  void show(){
    stroke(0);
    if(label==1){
      stroke(200);
      fill(255);
    }else{
      fill(0);
    }
    float px=getX();
    float py=getY();
    ellipse(px,py,12,12);
  }
}