class Level{
  
  public int levelnumber;
  Planet[] planets;
  PVector[] position;
  
  Level(int levelnumber){
    this.levelnumber = levelnumber;
  }
  
  public Planet[] getPlanets(){
    switch (levelnumber){
      case 1:
        planets = new Planet[1];
        planets[0] = new Planet(new PVector(500, 500), 30000000.0, 100);
        return planets;
      default:
        return null;
    }
  }
  
  public PVector[] getPos(){
    switch (levelnumber){
      case 1:
        position = new PVector[2];
        position[0] = new PVector(200, 300);  //posicao da bola
        position[1] = new PVector(700, 800);  //posicao da cesta
        return position;
      default:
        return null;
    }
    
  }
}
