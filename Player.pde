class Player
{
  PVector pos;
  PVector location;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  int ship_size = 20;
  
  float timeDelta = 1.0f / 60.0f;
  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 1.0f / fireRate;
  
  
  
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);

    //location = new PVector(100, 30);
    
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    int temp = frameCount % 30;
    if (checkKey(up))
    {
      pos.y -= 2;
      if(pos.y <= 450)
      {
        pos.y += 2;
      }
    }
    if (checkKey(down))
    {
      pos.y += 2;
      if(pos.y >= height)
      {
        pos.y -= 2;
      }
    }
    if (checkKey(left))
    {
      pos.x -= 2;
      if(pos.x <= 0)
      {
        pos.x = width;
      }
    }    
    if (checkKey(right))
    {
      pos.x += 2;
      if(pos.x >= width)
      {
        pos.x = 0;
      }
    }
    if (checkKey(start))       
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
        if(temp == 0)
        {
          println("Player " + index + " button e");
          Bullets bullets = new Bullets();
          bullets.x = pos.x + ship_size;
          bullets.y = pos.y;
          bullet.add(bullets);       
        }
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
      if(end_screen = true)
      {
         lives = 3;
         score_in_game = 0;
         end_screen = !end_screen; 
      }
    }    
  }
  
  void display()
  {    
    // spaceshipp
    stroke(colour);
    line(pos.x, pos.y, (pos.x + ship_size), pos.y - ship_size);
    line((pos.x + (ship_size *2)), pos.y, (pos.x + ship_size), pos.y - ship_size);
    line(pos.x, pos.y, pos.x + (ship_size * 2), pos.y);
    line(pos.x, pos.y, pos.x, (pos.y + ship_size));
    line(pos.x, (pos.y + ship_size), (pos.x + 20), pos.y);
    line((pos.x + 20), pos.y, pos.x + (ship_size * 2), (pos.y + 20));
    line((ship_size * 2) + pos.x, (pos.y + 20), pos.x + (ship_size * 2), pos.y);
  }  
  
  void hit_detection()
  {
     for(int i = 0; i < m_bullet.size(); i ++)
     {
       Bullets bullets =  m_bullet.get(i);
       if(dist(bullets.x1, bullets.y1, pos.x, pos.y) <= 40)
       {
         m_bullet.remove(i);
         lives--;
         background(#FF0000);
         
         if(lives == 0)
         {
           end_screen = true;
         }
       }
       
     }
  } 
  
   void m_ship_hit_detection()
  {
    for(int i = 0; i < bullet.size(); i ++)
    {
      Bullets bullets1 = bullet.get(i);
      if(dist(m_ship.x, m_ship.y, bullets1.x, bullets1.y) <= 50)
      {
        bullet.remove(i);
        m_ship.x = 600;
      }
      if(bullets1.y <= 0)
      {
        bullet.remove(i);
      }
        
    }
  }
}


