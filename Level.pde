class Level{
  
  public int levelnumber;
  Planet[] planets;
  PVector position;
  Cesta cesta;
  Estilingue estilingue;
  
  Level(int levelnumber){
    this.levelnumber = levelnumber;
  }
  
  public Planet[] getPlanets(){
    switch (levelnumber){
      case 1:
        planets = new Planet[2];
        planets[0] = new Planet(new PVector(850, 500), 25000000.0, 150);
        planets[1] = new Planet(new PVector(200, 200), 30000000.0, 100);
        return planets;
      case 2:
        planets = new Planet[2];
        planets[0] = new Planet(new PVector(250, 500), 40000000.0, 200);
        planets[1] = new Planet(new PVector(800, 200), 20000000.0, 100);
        return planets;
      case 3:
        planets = new Planet[3];
        planets[0] = new Planet(new PVector(1050, 500), 25000000.0, 100);
        planets[1] = new Planet(new PVector(350, 250), 40000000.0, 200);
        planets[2] = new Planet(new PVector(750, 500), 35000000.0, 150);
        return planets;
      default:
        return null;
    }
  }
  
  public PVector getPos(){
    switch (levelnumber){
      case 1:
        position = new PVector(200, 300);  //posicao da bola
        return position;
      case 2:
        position = new PVector(450, 200);
        return position;
      case 3:
        position = new PVector(450, 200);
        return position;
      default:
        return null;
    }
    
  }
  
   public Cesta getCesta(){
    switch (levelnumber){
      case 1:
        cesta = new Cesta(new PVector(300,200));  //posicao da bola
        return cesta;
      case 2:
        cesta = new Cesta(new PVector(800,100));  //posicao da bola
        return cesta;
      case 3:
        cesta = new Cesta(new PVector(150,250));  //posicao da bola
        return cesta;
      default:
        return null;
    }
  }
  public Estilingue getEstilingue(){
    switch (levelnumber){
      case 1:
        estilingue = new Estilingue(new PVector(1000, 500));  //posicao da bola
        return estilingue;
      case 2:
        estilingue = new Estilingue(new PVector(450, 500));  //posicao da bola
        return estilingue;
      case 3:
        estilingue = new Estilingue(new PVector(1150, 500));  //posicao da bola
        return estilingue;
      default:
        return null;
    }
  }
}
