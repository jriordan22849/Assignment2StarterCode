class Bullets extends Player
{
  float x, y;
  float bx, by;
  float speed = 5.0f;
  Bullets()
  {
    x = pos.x;
    y = pos.y;
  }
  
  void move()
  {
     x += bx * speed;
     y += by * speed;
  }
  
  void display()
  {
    stroke(255);
    line(0, -20, 0 , 5);
  }
    
}
