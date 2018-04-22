class Planet{

  float radius;
  float distance;
  float  angle;
  float orbitspeed = 0;
  Planet[] planets;
  PVector v;
  PShape imgs;
      
  Planet(float r,float d,float o,PImage img){
    
     v = PVector.random3D();
     radius = r;
     angle = random(TWO_PI);
     distance = d;
     v.mult(distance);
     orbitspeed = o;
     noStroke();
     noFill();
     imgs = createShape(SPHERE,radius);
     imgs.setTexture(img);
  }
  
  void orbit(){

    angle += orbitspeed;
    if(planets != null){
      for(int i=0;i<planets.length;i++){
        planets[i].orbit();
      }
    }  
  }
  
  void spawn(int total,int level){
    
    planets = new Planet[total];
    for(int i = 0;i<total;i++){
      int t = int(random(0,textures.length));
      planets[i] = new Planet (radius/(level*1.2),random(400,950)/(level*2),random(-0.02,0.05),textures[t]);
      if(level<2){
        int num = int(random(0,3));
        planets[i].spawn(num,level+1);
      }
    }
  }
  
  void show(){
 
    pushMatrix();
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    rotate(angle,p.x,p.y,p.z);
    translate(v.x,v.y,v.z);
    fill(255);
    noStroke();
    shape(imgs);//sphere(radius);
    //ellipse(0,0,radius*2,radius*2);
    if(planets != null){
      for(int i =0;i<planets.length;i++){
        planets[i].show();  
      }  
    }
    popMatrix();   
  }
}