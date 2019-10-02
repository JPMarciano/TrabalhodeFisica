PVector v = new PVector(0, 0);
float e = 0.9;
float oldt = millis()/1000.0;
float t, r, dt, tamcol, prod;
PVector v1, col, s,col1,s2;
PVector s1 = new PVector(0,0);
int level = 0;
boolean levelchange = false;
Level atual;
Planet[] planetas;
Cesta cesta;
PVector pos;

void setup(){
  size(1280,720);
}

void draw() {
  background(0);
  if (levelchange){
    level++;
    levelchange = false;
    atual = new Level(level);
    planetas = atual.getPlanets();
    pos = atual.getPos();
    cesta = atual.getCesta();
  }
  if (level==0){
    drawMenu();
  }
  else{
    
    //Metodo de Euler para gravidade
    //Para testes
    
    if (mousePressed) {
      pos.x = mouseX;
      pos.y = mouseY;
      v = new PVector(0,0);
    }
    
    
    //verificação de colisão
    
    s=s1.copy();
    for (int i = 0; i < planetas.length; i++){
    
      col = PVector.sub(planetas[i].pos, pos);
      tamcol = col.mag();
      col.div(tamcol);
      col1=col.copy();
      prod = v.dot(col);
      
      if ((tamcol <= 15+planetas[i].raio)&&(prod >= 0))
      {
        col.mult(-(1+e)*prod);
        v.add(col);
        s=s1.copy();
        pos=PVector.add(planetas[i].pos,col1.mult(-(planetas[i].raio+15)));
        break;
        
      }
     else{
      r = tamcol;
      col.mult(planetas[i].gravity/(r*r));
      s.add(col);
     }
    }
    t=millis()/1000.0;
    dt=t-oldt;
    oldt=t;
    v1 = v.copy();
    s2=s.copy();
    s.mult(dt);
    v.add(s);
    s2.mult(dt/2);
    v1.add(s2);
    v1.mult(dt);
    pos.add(v1);
   
    //desenhar nivel
   
    for (int i = 0; i < planetas.length; i++){
      fill(100, 200, 0);
      ellipse(planetas[i].pos.x, planetas[i].pos.y, planetas[i].raio*2, planetas[i].raio*2);
    }
    cesta.drawCesta(planetas[1].pos);    
    fill(0,100,0);
    ellipse(pos.x, pos.y, 30, 30);
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
