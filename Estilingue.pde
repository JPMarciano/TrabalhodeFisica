class Estilingue{
  public PVector pos;
  PVector v;
  float r;
    Estilingue(PVector pos){
    this.pos = pos;
    }
    void drawEstilingue(PVector posp){
    v = PVector.sub(pos,posp);
    r = v.mag();
    v=v.div(r);
    v=v.mult(50);
    stroke(127,255,212);
    strokeWeight(10);
    line(pos.x,pos.y,pos.x+v.x,pos.y+v.y);
}
}
