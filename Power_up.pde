class Power_up extends Player
{
  int power_speed = 0;
  float x, y, size;
  
  Power_up(float x, float y, float size)
  {
    this.x = x; 
    this.y = y;
    this.size = size;
  }
  
  void display()
  {
    fill(#FFDDA5);
    stroke(#FFBA4B);
    strokeWeight(4);
    ellipse(x, y + power_speed, size, size);
  }
  void move()
  {
    power_speed++;
  }
  
  void power_up_hit_detection()
  {
    for(int j = 0; j < players.size(); j ++)
    {
      Player temp_player = players.get(j);
    for(int i = 0; i < power_up.size(); i ++)
    {
      Power_up p_up = power_up.get(i);
      if(dist( p_up.x, p_up.y + power_speed, temp_player.pos.x, temp_player.pos.y) <= 30)
      {
        player6 = power_up_sound.loadFile("Powerup2.wav");
        player6.play();
        lives += 1;
        background(#FFDDA5);
        power_up.remove(i);
        create_power_ups();
      }
      if(p_up.y + power_speed > height)
      {
        power_up.remove(i);
        create_power_ups();
      }
    }
    }
  }
}

