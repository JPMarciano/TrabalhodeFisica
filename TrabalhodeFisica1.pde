PVector v = new PVector(0, 0);
float e = 0.9;
float oldt = millis()/1000.0;
float t, r, dt, tamcol, prod;
PVector d, v1, col;
int level = 0;
boolean levelchange = false;
Level atual;
Planet[] planetas;
PVector[] pos;

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
  }
  if (level==0){
    drawMenu();
  }
  else{
    
    //Metodo de Euler para gravidade
    
    d = PVector.sub(planetas[0].pos, pos[0]);
    r = d.mag();
    d.mult(planetas[0].gravity/(r*r*r));
    t = millis()/1000.0;
    dt = t - oldt;
    oldt = t;
    d.mult(dt);
    v.add(d);
    v1 = v.copy();
    v1.mult(dt);
    pos[0].add(v1);
    
    
    //Para testes
    
    if (mousePressed) {
      pos[0].x = mouseX;
      pos[0].y = mouseY;
    }
    
    
    //verificação de colisão
    
    col = PVector.sub(planetas[0].pos, pos[0]);
    tamcol = col.mag();
    col.div(tamcol);
    prod = v.dot(col);
    
   if ((tamcol <= 15+planetas[0].raio)&&(prod > 0))
   {
     col.mult(-2*prod);
     v.add(col);
     v.mult(e);
   }
   
   
   //desenhar nivel
   
    fill(100, 200, 0);
    ellipse(planetas[0].pos.x, planetas[0].pos.y, planetas[0].raio*2, planetas[0].raio*2);
    fill(0,100,0);
    ellipse(pos[0].x, pos[0].y, 30, 30);
  }
}

public void drawMenu(){
  float x=800, y=300, w=200, h=90;
  rect(x,y,w,h);
  fill(255);
  if(mousePressed){
    if(mouseX>x && mouseX <x+w && mouseY>y && mouseY<y+h){
      levelchange = true;
      fill(0);
    }
  }
}
