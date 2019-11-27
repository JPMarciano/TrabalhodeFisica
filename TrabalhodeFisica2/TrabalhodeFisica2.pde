PImage curva;
float t0, t, d=PI;
PVector pos = new PVector(0,50);
float r=230, w=1;

void setup() {
  size(1100,700);
  noFill();
  frameRate(60);
  curva = loadImage("bachi.png");
}

void draw() {
  background(255);
  t0 = millis()/1000.0;
  ellipse(pos.x, pos.y, 30, 30);
  fill(255,99,71);
  stroke(255,99,71);
  
  pos = cicloide(pos, d);
  imageMode(CORNER);
  image(curva, 65, 75, 980, 505);
  t = millis()/1000.0;
  d+=t-t0;
}

PVector cicloide(PVector pos, float tp){
  pos.x=-630+r*w*tp+r*sin(w*tp);
  pos.y=537-r+r*cos(w*tp);
  return pos;
}

void drawCurve(float t, float[] pt){
  curveTightness(t);
  beginShape();
  curveVertex(pt[0], pt[1]);
  curveVertex(pt[2], pt[3]);
  curveVertex(pt[4], pt[5]);
  curveVertex(pt[6], pt[7]);
  curveVertex(pt[8], pt[9]);
  curveVertex(pt[10], pt[11]);
  curveVertex(pt[12], pt[13]);
  endShape();
  strokeWeight(10);
}
