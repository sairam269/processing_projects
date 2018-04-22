import peasy.*;
//
PeasyCam cam;
Planet sun;
PImage img;
PImage[] textures = new PImage[6];

void setup(){

  img = loadImage("sunmap.jpg");
  cam = new PeasyCam(this,1000);
  textures[0] = loadImage("uranusmap.jpg");
  textures[1] = loadImage("earthmap1k.jpg");
  textures[2] = loadImage("marsmap1k.jpg");
  textures[3] = loadImage("jupitermap.jpg");
  textures[4] = loadImage("mercurymap.jpg");
  textures[5] = loadImage("venusmap.jpg");
  size(600,600,P3D);
  sun = new Planet(70,0,0,img);
  sun.spawn(4,1);

}

void draw(){

  background(0);
  lights();
  fill(255);
 // translate(width/2,height/2);
  sun.show();
  sun.orbit();
}