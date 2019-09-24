PVector p1 = new PVector(600, 450);
PVector p2 = new PVector(800, 1000);
PVector v = new PVector(100, 0);
float e = 0.9;
float oldt = millis()/1000.0;
float t, r, dt, tamcol, prod;
float f1 = 30000000.0;
PVector d, v1, col;

void setup(){
  fullScreen();
}

void draw() {
  background(0);
  
  d = PVector.sub(p1, p2);
  r = d.mag();
  d.mult(f1/(r*r*r));
  t = millis()/1000.0;
  dt = t - oldt;
  oldt = t;
  d.mult(dt);
  v.add(d);
  v1 = v.copy();
  v1.mult(dt);
  p2.add(v1);
  
  if (mousePressed) {
    p2.x = mouseX;
    p2.y = mouseY;
  }

  
  //verificação de colisão
  
  col = PVector.sub(p1, p2);
  tamcol = col.mag();
  col.div(tamcol);
  prod = v.dot(col);
  
 if ((tamcol <= 165)&&(prod > 0))
 {
   col.mult(-2*prod);
   v.add(col);
   v.mult(e);
 }
 
  fill(100, 200, 0);
  ellipse(p1.x, p1.y, 300, 300);
  fill(0,100,0);
  ellipse(p2.x, p2.y, 30, 30);
}
