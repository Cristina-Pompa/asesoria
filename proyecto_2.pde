import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

float r;
float g;
float bl;
float w;
float h;
float w_;
float h_;

ArrayList <Huella> huellas;

Huella una;
Suelo limite;
Suelo limiteDos;
Box2DProcessing mundo;

void setup(){
 
 background(255);
 size(600,600);
 mundo = new Box2DProcessing(this);
 mundo.createWorld();
 una = new Huella(mouseX,mouseY,w_,h_);
 huellas = new ArrayList <Huella>();
 limite = new Suelo(125,400,250,10);
 limiteDos = new Suelo(475,400,250,10);
 
 
 r = random(0,255);
 g = random(0,255);
 bl = random(0,255);

}

void mousePressed (){

  w=10;
  h=10;
  
  noStroke();
  fill(r,g,bl);
  rect(mouseX,mouseY,w,h); 
  
}

void mouseReleased(){
  w=w_;
  h=h_;
  huellas.add(new Huella (mouseX, mouseY, w,h));
}

void draw(){

mundo.step();
una.display();
for(Huella h:huellas){
h.display();
}
limite.display();
limiteDos.display();

mousePressed ();
  w++; 
  h++;
}
