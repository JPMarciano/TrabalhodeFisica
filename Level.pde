class Level{
  
  public int levelnumber;
  Planet[] planets;
  PVector position;
  Cesta cesta;
  
  Level(int levelnumber){
    this.levelnumber = levelnumber;
  }
  
  public Planet[] getPlanets(){
    switch (levelnumber){
      case 1:
        planets = new Planet[2];
        planets[0] = new Planet(new PVector(850, 500), 25000000.0, 150);
        planets[1] = new Planet(new PVector(200, 200), 20000000.0, 100);
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
      default:
        return null;
    }
    
  }
   public Cesta getCesta(){
    switch (levelnumber){
      case 1:
        cesta = new Cesta(new PVector(200,250));  //posicao da bola
        return cesta;
      default:
        return null;
    }
  }
}
