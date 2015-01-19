class Bullets extends Player
{
  float x, y;
  float speed = -10.0f;
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  
  Bullets()
  {
    x = pos.x + (ship_size * 2);
    y = pos.y;
  }
  
  void move()
  {
    y += speed;
    ellapsed += timeDelta;
  }
   
  void display()
  {
    stroke(255);
    line(x , y, x, y + speed);
  }
  
}
