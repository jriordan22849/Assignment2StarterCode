Background[] background;
class Background
{
  float x, y;
  
  Background()
  {
    x = random(0, width);
    y = random(0, height);
  }
  
  void display()
  {
    stroke(255);
    ellipse(x,y,2,2);
  }
}
    
