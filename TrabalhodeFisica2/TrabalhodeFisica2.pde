float d=0, g;
float r=260, w=0.2;
PVector[] ciclo = new PVector[20];
PVector[] parab = new PVector[20];
Checkbox[] caixas = new Checkbox[3];
Boolean botao=false;
float x0, y0, xf, yf, teta, coss, sen, hip;
PVector posc, posr, posu, pos1, pos2, pos3;

void setup() {
  size(1100,700);
  noFill();
  frameRate(60);
  for(int i=0;i<20;i++){
    ciclo[i]=new PVector(-790+r*(w*i+PI)+r*sin(w*i+PI),600-r+r*cos(w*i+PI));
  }
  caixas[0]=new Checkbox(1000, 100);
  caixas[1]=new Checkbox(1000, 130);
  caixas[2]=new Checkbox(1000, 160);
  pos2 = new PVector(-790+r*PI, 600-2*r);
  g=w*w*r/4.0;
  x0 = -790+r*PI;
  y0 = 600-2*r;
  xf = -790+r*(w*18+PI)+r*sin(w*18+PI);
  yf = 600-r+r*cos(w*18+PI);
  hip = sqrt((xf-x0)*(xf-x0)+(yf-y0)*(yf-y0));
  coss = (xf-x0)/hip;
  sen = (yf-y0)/hip;
  posc= new PVector(x0,y0);
  posr = new PVector(x0,y0);
  posu = new PVector(x0,y0);
  pos1=new PVector(x0,y0);
  pos2=new PVector(x0,y0);
  pos3=new PVector(x0,y0);
}

void draw() {
  background(255);
  
  if ((caixas[0].b)||(caixas[1].b)||(caixas[2].b)){
    
    if(caixas[0].b){
      noFill();
      stroke(0);
      strokeWeight(10);
      drawCurve(0,20,ciclo);
    }
    
    if(caixas[1].b){
      stroke(0);
      strokeWeight(10);
      line(-790+r*PI, 600-2*r, -790+r*(w*18+PI)+r*sin(w*18+PI), 600-r+r*cos(w*18+PI));
    }
    
    if(caixas[2].b){
      stroke(0);
      strokeWeight(10);
      drawCurvinha();
    }
    
    if(caixas[0].b){
      pos1 = cicloide(d, pos1);
      fill(255,99,71);
      stroke(255,99,71);
      ellipse(pos1.x, pos1.y, 30, 30); 
    }
    
    if(caixas[1].b){
      pos2 = reta(d, pos2);
      fill(153,204,50);
      stroke(153,204,50);
      ellipse(pos2.x, pos2.y, 30, 30);
    }
    
    if(caixas[2].b){
      pos3 = curvinha(d, pos3);
      fill(0,127,255);
      stroke(0,127,255);
      ellipse(pos3.x, pos3.y, 30, 30);
    }
    
    d+=0.18;
    
  }else{
    d=0;
  } 
  
  for(int i=0;i<3;i++){
    caixas[i].render();
  }

  fill(0);
  rect(960,10,100,50);
  if ((mousePressed)&&(mouseX>=960)&&(mouseX<=1060)&&(mouseY>=10)&&(mouseY<=60)){
    d=0;
    pos1=new PVector(x0,y0);
    pos2=new PVector(x0,y0);
    pos3=new PVector(x0,y0);
  }
}

PVector cicloide(float tp, PVector posc){
  if(posc.x<=xf){
    posc.x=x0+r*w*tp-r*sin(w*tp);
    posc.y=y0+r-r*cos(w*tp);
  }
  return posc;
}

PVector reta(float tp, PVector posr){
  if (posr.x<=xf){
    posr.x = x0 + g*coss*sen*tp*tp/2.0;
    posr.y = y0 + g*sen*sen*tp*tp/2.0;
  }
  return posr;
}

PVector curvinha(float tp, PVector posu){
  if (posu.y<yf-10){
    posu.x = x0;
    posu.y = y0 + g*tp*tp/2.0;
  }else{
    if(posu.x<=xf){
      posu.x = x0 + sqrt(2*g*(yf-y0))*(tp-sqrt(2*(yf-y0)/g));
      posu.y = yf;
    }
  }
  return posu;
}

void drawCurvinha(){
  line(x0,y0,x0,yf-10);
  line(x0+10,yf,xf,yf);
  stroke(0);
  curve(x0, yf-50, x0, yf-10, x0+10, yf,  x0+50, yf);
}

void drawCurve(float t, int n, PVector[] pt){
  curveTightness(t);
  beginShape();
  for(int j=0; j<n; j++){
    curveVertex(pt[j].x, pt[j].y);
  }
  endShape();
  strokeWeight(10);
}

void mousePressed(){
  for(int i=0; i< 3; i++){
    caixas[i].click();
  }
}
