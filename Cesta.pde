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
    stroke(200,0,0);
    strokeWeight(10);
    line(pos.x,pos.y,pos.x+v.x,pos.y+v.y);
    stroke(200,0,0);
    fill(200,0,0);
    ellipse(pos.x+v.x+25,pos.y+v.y+25,50,50);
  }
}
