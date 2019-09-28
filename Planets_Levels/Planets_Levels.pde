class Planet{
  
  public float gravity;
  public PVector pos;
  public float raio;
  
  Planet(PVector pos, float gravity, float raio){
       this.pos = pos;
       this.gravity = gravity;
  }

}

class Level{
  
  public int levelnumber;
  
  Level(int levelnumber){
    this.levelnumber = levelnumber;
  }
  
  public Planet[] getPlanets(){
    switch levelnumber{
      case 0{
        drawMenu();
        return null;
      }
      case 1{
        return Planet(new PVector(500, 500), 30000000.0, 100);
      }
      
    }
  }
  
  public void drawMenu(){
    
    
    
  }
  
  
  
}
