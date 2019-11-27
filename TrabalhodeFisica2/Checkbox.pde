class Checkbox {
  int x, y;
  boolean b;
  Checkbox(int _x, int _y){
    x = _x;
    y = _y;
    b = false;
  }
  void render(){
    stroke(0);
    strokeWeight(1);
    fill(isOver()?128:0);
    rect(x, y, 20, 20);
    if(b){
      noFill();
      line(x, y, x+20, y+20);
      line(x, y+20, x+20, y);
    }
  }
  void click(){
    if(isOver()){
      b=!b;
    }
  }
  boolean isOver(){
    return(mouseX>x&&mouseX<x+20&&mouseY>y&&mouseY<y+20);
  }
}
