class Cesta{

  public PVector pos;
  PVector v;
  float r;
  Cesta(PVector pos){
    this.pos = pos;
   } 

  void drawCesta(PVector posp){
    v = PVector.sub(pos,posp);
    r = v.mag();
    v=v.div(r);
    v=v.mult(50);
    stroke(222,184,135);
    strokeWeight(10);
    line(pos.x,pos.y,pos.x+v.x,pos.y+v.y);
    noStroke();
    fill(220,20,60);
    ellipse(pos.x+v.x*(1.5),pos.y+v.y*(1.5),50,50);
    noStroke();
    fill(250,250,250);
    ellipse(pos.x+v.x*(1.5),pos.y+v.y*(1.5),20,20);
  }
}
