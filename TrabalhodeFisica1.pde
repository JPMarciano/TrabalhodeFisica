PVector v = new PVector(0, 0);
float e = 0.9;
float oldt = millis()/1000.0;
float t, r, dt, tamcol, prod;
PVector v1, col;
PVector s = new PVector(0,0);
int level = 0;
boolean levelchange = false;
Level atual;
Planet[] planetas;
PVector[] pos, d;

void setup(){
  fullScreen();
}

void draw() {
  background(0);
  if (levelchange){
    level++;
    levelchange = false;
    atual = new Level(level);
    planetas = atual.getPlanets();
    pos = atual.getPos();
    d = new PVector[planetas.length];
    print(planetas.length);
  }
  if (level==0){
    drawMenu();
  }
  else{
    
    //Metodo de Euler para gravidade
    
    for(int i=0; i<d.length; i++){
      d[i] = PVector.sub(planetas[i].pos, pos[0]);
      r = d[i].mag();
      d[i].mult(planetas[i].gravity/(r*r*r));
      s.add(d[i]);
    }
    
    t = millis()/1000.0;
    dt = t - oldt;
    oldt = t;
    s.mult(dt);
    v.add(s);
    v1 = v.copy();
    v1.mult(dt);
    pos[0].add(v1);
    
    
    //Para testes
    
    if (mousePressed) {
      pos[0].x = mouseX;
      pos[0].y = mouseY;
      v = new PVector(0,0);
    }
    
    
    //verificação de colisão
    
    for (int i = 0; i < planetas.length; i++){
    
      col = PVector.sub(planetas[i].pos, pos[0]);
      tamcol = col.mag();
      col.div(tamcol);
      prod = v.dot(col);
      
      if ((tamcol <= 15+planetas[i].raio)&&(prod > 0))
      {
        col.mult(-(1+e)*prod);
        v.add(col);
      }
    }
   
    //desenhar nivel
   
    for (int i = 0; i < planetas.length; i++){
      fill(100, 200, 0);
      ellipse(planetas[i].pos.x, planetas[i].pos.y, planetas[i].raio*2, planetas[i].raio*2);
    }
    
    fill(0,100,0);
    ellipse(pos[0].x, pos[0].y, 30, 30);
    }
}

public void drawMenu(){
  float x=300, y=300, w=200, h=90;
  rect(x,y,w,h);
  fill(255);
  if(mousePressed){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      levelchange = true;
      fill(0);
    }
  }
}
