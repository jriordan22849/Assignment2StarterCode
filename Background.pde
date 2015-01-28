// class for the background to get the stars x and y position and to display the stars.(circles)
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
    fill(255);
    ellipse(x,y,2,2);
  }
}
    
