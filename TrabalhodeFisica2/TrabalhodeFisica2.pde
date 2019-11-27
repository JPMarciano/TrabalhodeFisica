float d=0;
PVector pos1, pos2=new PVector(50,50), pos3;
float r=260, w=0.2;
PVector[] ciclo = new PVector[20];
Checkbox[] caixas = new Checkbox[3];
Boolean botao=false;

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
}

void draw() {
  background(255);
   
  
  
  if ((caixas[0].b)||(caixas[1].b)||(caixas[2].b)){
    if(caixas[0].b){
      noFill();
      stroke(0);
      strokeWeight(10);
      drawCurve(0,20,ciclo);
      
      pos1 = cicloide(d);
      fill(255,99,71);
      stroke(255,99,71);
      ellipse(pos1.x, pos1.y, 30, 30); 
    }
    
    if(caixas[1].b){
      noFill();
      stroke(0);
      strokeWeight(10);
      
      
      fill(153,204,50);
      stroke(153,204,50);
      ellipse(pos2.x, pos2.y, 30, 30); 
    }
    
    if(d<=18){
      d+=0.19;
    }
    
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
  }
}

PVector cicloide(float tp){
  PVector posc = new PVector(0,0);
  posc.x=-790+r*(w*tp+PI)+r*sin(w*tp+PI);
  posc.y=600-r+r*cos(w*tp+PI);
  return posc;
}

//PVector arco(float tp){
//  PVector posa = new PVector(0,0);
  
//  return posa
//}

void drawCurve(float t,int n, PVector[] pt){
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
