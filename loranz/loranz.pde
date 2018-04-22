import peasy.*;

PeasyCam cam;

 float x=0.01,y=0,z=0;
 float a =10;
 float b =28;
 float c =8/3;
 float dx,dy,dz;
 float dt = 0.01;
 ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  
  size(600,600,P3D);
  cam = new PeasyCam(this,600);
  colorMode(HSB);  
  
}

void draw(){
 
 background(51);
  
 dx = (a*(y-x))*dt;
 dy = (x*(b-z)-y)*dt;
 dz = (x*y - c*z)*dt;
 
 x = dx + x;
 y = dy + y;
 z += dz;
 //dt += 0.1;
//fill(255,255,255);
 
 points.add(new PVector(x,y,z));
 noFill();
 //translate(0,0,-80);
 scale(5);
 //strokeWeight(1);
 beginShape();
 float hu =0;
 for(PVector v : points){
    stroke(hu,255,255);
    vertex(v.x,v.y,v.z);
    if(hu>255)
      hu = 0;
    hu += 1;  
 }
 endShape();    
// dt += 0.000001;
}