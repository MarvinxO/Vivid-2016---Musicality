import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
Bar bar[];

float angle = 0; //angle of rotation
float speed = 0.001; //speed of rotations
float delta; //angle in radians - used to points in a circle
float inner;
float outer;
int points;

void setup() {
  
  size(1366, 768, P3D);
  colorMode(HSB, 360, 255, 255);
  background(0);

  minim = new Minim(this);
  //Insert .mp3 file here
  player = minim.loadFile("Love Never Felt So Good.mp3", 360);
  player.play();
  
  //print(player.bufferSize());
  
  points = 360;
  delta = radians(360/points);
  inner = width/8;
  outer = width/4;
  bar = new Bar[points];
  
  //Assign initial point and target point
  for (int i = 0; i < points; i ++) {
      
      stroke(i, 255, 255, 100);
      strokeWeight(1);

      float ox = outer * cos(i*delta);
      float oy = outer * sin(i*delta);

      float ix = inner * cos(i*delta);        
      float iy = inner * sin(i*delta);
      
      bar[i] = new Bar(ix, iy, ox, oy);
      
    }
  
}

void draw() {
  background(0);
  angle += speed;
  
  translate(width/2, height/2);
  rotateZ(angle);
  for (int i = 0; i < points; i ++) {
    stroke(i, 255, 255);
    bar[i].display();
    bar[i].level(abs(player.left.get(i)));
  }
}
