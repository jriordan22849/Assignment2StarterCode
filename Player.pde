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
  int w = 60;
  int h = 30;
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
      if(pos.y > height - 20)
      {
        pos.y -= 2;
      }
    }
    if (checkKey(left))
    {
      pos.x -= 2;
      if(pos.x + w <= 0)
      {
        pos.x = width;
      }
    }    
    if (checkKey(right))
    {
      pos.x += 2;
      if(pos.x - w >= width)
      {
        pos.x = 0;
      }
    }
    if (checkKey(start))       
    {
      println("Player " + index + " start or s");
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
      println("Player " + index + " butt2 or r");
    }    
  }
  
  void display()
  {    
    // spaceshipp
    fill(#95FFDD);
    stroke(#36FFBE);
    ellipse(pos.x, pos.y - 10, w - 25,h);
    stroke(#95FFDD);
    ellipse(pos.x, pos.y, w, h); 
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
       }
       
     }
  } 
  
   void m_ship_hit_detection()
  {
    for(int i = 0; i < bullet.size(); i ++)
    {
      Bullets bullets1 = bullet.get(i);
      if(dist(m_ship.x + 10, m_ship.y, bullets1.x, bullets1.y) <= 40)
      {
        bullet.remove(i);
        score_in_game += 10;
        m_ship.x = width + 50;
      }
      if(bullets1.y <= 0)
      {
        bullet.remove(i);
      }
        
    }
  }
  
  void fleet_hit_detection()
  {
    for(int i = 0; i < bullet.size(); i ++)
    {
      Bullets bullet2 = bullet.get(i);
      for(int j = 0; j < fleet.size(); j ++)
      {
        Fleet fleet3 = fleet.get(j);
        if(dist(bullet2.x, bullet2.y, fleet3.x, fleet3.y) <= 30)
        {
          bullet.remove(i);
          fleet.remove(j);
          score_in_game += 5;
        }
      }
    }
  }
    
}


