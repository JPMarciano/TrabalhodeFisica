/* Posição, massas e velocidades dos corpos iniciais
 (unidades 1 s de simulação = 10^6 s na vida real)
 (1 pixel = 10^9 m)
 (1 unidade de massa = 10^24 kg)
*/

PVector p1 = new PVector(400, 900); //(unidade: 1 pixel = 10^9 m)
PVector p2 = new PVector(400, 10);
PVector v1 = new PVector(0, 0); //(unidade: 10^9 m / 10^6 s)
PVector v2 = new PVector(40, 0);
float m1 = 2000000; //(unidade: 10^24 kg)
float m2 = 6;

float G = 0.07;  // gravitacão (unidade (10^9 m)^3 / (10^24 kg) (10^6 s)^2

float coef = 0.8;

float oldt = millis()/1000.0; //instante inicial
float t, dt, d, tamcol, prod;
PVector Fg, dp1, dp2, a1, a2, col, colu;


void setup()
{
    size(800,800);
    frameRate(60);
    background(0);
}


void draw()
{
    background(0);  
  
    //cálculo da força de gravitação sobre o corpo 1
    Fg = PVector.sub(p2, p1);
    d = Fg.mag();
    Fg = Fg.mult(G*m1*m2/(d*d));
    
    //tempo transcorrido desde último desenho
    t = millis()/1000.0;
    dt = t - oldt;
    oldt = t;
    
    //atualização da posição de cada corpo
    dp2 = v2.copy();
    dp2.mult(dt);
    p2 = p2.add(dp2);
    
    //variação de velocidade para cada corpo (força*delta(t)/massa)
    a2 = PVector.mult(Fg, -dt/m2);
    
    //atualização das velocidades
    v2 = v2.add(a2);
    
    //verificação de colisão
    col = PVector.sub(p1, p2);
    tamcol = col.mag();
    colu = col.div(tamcol);
    prod = v2.dot(colu);
    if (tamcol <= 410)
    {
        v2 = v2.sub(colu.mult(2*prod));
        v2 = v2.mult(coef);
    }
    
    //desenho dos corpos
    fill(255,255,0);
    ellipse(p1.x, p1.y, 800, 800);
    fill(0,255,255);
    ellipse(p2.x, p2.y, 20, 20);
}
