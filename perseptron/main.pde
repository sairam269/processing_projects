Perseptron brain;

Point[] points=new Point[100];

int t=0;

void settings(){
  size(500,500);
}

void setup(){
  //size(200,200);
  brain=new Perseptron(3);
  for(int i=0;i<points.length;i++){
    points[i]=new Point();
  }
}

void draw(){

  background(255);
  stroke(0);
  
  float x1=-1,y1=f(x1),x2=1,y2=f(x2);
  
  Point p1=new Point(x1,y1);
  Point p2=new Point(x2,y2);
  line(p1.getX(),p1.getY(),p2.getX(),p2.getY());
  
  Point p3=new Point(-1,brain.guessY(-1));
  Point p4=new Point(1,brain.guessY(1));
  line(p3.getX(),p3.getY(),p4.getX(),p4.getY());
  
  for(Point p:points){
    p.show();
  }
  
  for(Point p:points){
    float[] ins={p.x,p.y,p.bias};
    int target=p.label;
    //brain.train(ins,target);
    int guess=brain.guess(ins);
    if(guess==target){
      fill(0,255,0);
    }else{
      fill(255,0,0);
    }
    stroke(2);
    ellipse(p.getX(),p.getY(),6,6);
  }
  
  Point tr=points[t];
  float[] ins={tr.x,tr.y,tr.bias};
  int target=tr.label;
  brain.train(ins,target);
  t=t+1;
  
  if(t>=points.length){
    t=0;
  }
  
}