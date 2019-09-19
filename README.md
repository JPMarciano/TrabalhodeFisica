# TrabalhodeFisica1
PVector p1 = new PVector(500,500);
PVector p2 = new PVector(1000,600);
PVector v = new PVector(1000000,10000);
float k1=20.0;
float e=0.9;
float oldt = millis()/1000.0;
float t,f,r, dt, tamcol, prod;
float f1=1000000000.0;
PVector d;

void setup(){
  fullScreen();
}
void draw() {
  background(0,0,0);
  if (mousePressed) {
    p2.x = mouseX;
    p2.y = mouseY;
  }
   d=PVector.sub(p2,p1);
   r = d.magSq();
   f=f1/r;
   d = d.div(d.mag());
   d=d.mult(f);
   t=millis()/1000.0;
   dt=t-oldt;
   d=d.mult(dt);
   v = v.add(d);
   p2 = PVector.sub(p2,(v.mult(dt)));
   fill(200,200,200);
   ellipse(p1.x,p1.y,400,400);
   fill(200,200,200);
   ellipse(p2.x,p2.y,10,10);
   oldt=t;
}
