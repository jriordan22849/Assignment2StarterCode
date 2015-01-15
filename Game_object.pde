ArrayList<Game_object> objects = new ArrayList<Game_object>();
class Game_object extends Player
{
  PVector bullet_position = new PVector(width / 2, height / 2);
  boolean alive;
  float theta;
  
  Game_object()
  {
    alive = true;
    bullet_position.x = pos.x;
    bullet_position.y = pos.y;
  }
  
  void move()
  {
  }
  
  void display()
  {
  }
}
    
