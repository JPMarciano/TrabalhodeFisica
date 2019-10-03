PVector v = new PVector(0, 0);
float e = 0.9;
float oldt;
float t, r, dt, tamcol, prod;
PVector v1, col, s,col1,s2;
PVector s1 = new PVector(0,0);
int level = 0;
boolean levelchange = false;
Level atual;
Planet[] planetas;
Cesta cesta;
Estilingue estilingue;
PVector pos;
boolean c=true;
boolean d=false;
float k = 5;
PVector p = new PVector(0, 0);
PImage fundo, planeta1;
PShape planeta;


void setup(){
  size(1280,720);
  fundo = loadImage("espaco.jpg");
  planeta1 = loadImage("earth.jpg");
  noStroke();
}

void draw() {
  background(fundo);
  if (levelchange){
    level++;
    levelchange = false;
    atual = new Level(level);
    planetas = atual.getPlanets();
    pos = atual.getPos();
    cesta = atual.getCesta();
    estilingue = atual.getEstilingue();
    c = true;
  }
  if (level==0){
    drawMenu();
  }
  else if(level==4){
    fim();
  }
  else{
    estilingue.drawEstilingue(planetas[0].pos);
    if (c){  
      pos.x = estilingue.pos.x+(estilingue.pos.x-planetas[0].pos.x)*45/planetas[0].raio;
      pos.y = estilingue.pos.y+(estilingue.pos.y-planetas[0].pos.y)*45/planetas[0].raio;
      if(mousePressed){
        if(abs(mouseX-pos.x)<40 && abs(mouseY-pos.y)<40){
          d = true;
        }
      }
    }  
    else{
      
      if (abs(pos.x-(cesta.pos.x+(cesta.pos.x-planetas[1].pos.x)*75/planetas[1].raio))<20 && abs(pos.y-(cesta.pos.y+(cesta.pos.y-planetas[1].pos.y)*75/planetas[1].raio))<20){
        levelchange = true;
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
      }
      
      //desenhar nivel      
     
      for (int i = 0; i < planetas.length; i++){
        noStroke();
        fill(100, 200, 0);
        ellipse(planetas[i].pos.x, planetas[i].pos.y, planetas[i].raio*2, planetas[i].raio*2);
      }
      reset();
      cesta.drawCesta(planetas[1].pos); 
      noStroke();
      fill(138,43,226);
      ellipse(pos.x, pos.y, 30, 30);      
  }
}  
  
public void drawMenu(){
  float w=300, h=100;
  float x=width/2-w/2, y=height/2-h/2;
  fill(255);
  rect(x,y,w,h);
  fill(0);
  textSize(32);
  text("START", x+100, y+h-35); 

  if(mousePressed){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      levelchange = true;
      fill(0);
    }
  }
}

public void fim(){
  float w=300, h=100;
  float x=width/2-w/2, y=height/2-h/2;
  fill(255);
  rect(x,y,w,h);
  fill(0);
  textSize(32);
  text("FIM", x+120, y+h-35);
}

public void reset(){
  float x=1100, y=30, w=140, h=60;
  fill(255);
  rect(x,y,w,h);
  fill(0);
  textSize(32);
  text("RESET", x+20, y+h-20); 
  if(mousePressed){
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      level--;
      levelchange = true;
      fill(0);
    }
  }
}

void mouseDragged(){
  if(c && level>=1 && abs(mouseX-pos.x)<300 && abs(mouseY-pos.y)<300){
    stroke(0,255,0);
    strokeWeight(5);
    line(pos.x,pos.y,mouseX,mouseY);
  }  
}

void mouseReleased(){
  
  if (level>=1 && d){
      p.x=mouseX;
      p.y=mouseY;      
      v= PVector.sub(pos, p);
      v.mult(k);
      c=false;
      oldt = millis()/1000.0;
}
}
