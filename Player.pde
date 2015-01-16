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
  float theta;
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    location = new PVector(60, 30);
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
    if (checkKey(up))
    {
      pos.y -= 1;
      if(pos.y <= 450)
      {
        pos.y += 1;
      }
    }
    if (checkKey(down))
    {
      pos.y += 1;
      if(pos.y >= height)
      {
        pos.y -= 1;
      }
    }
    if (checkKey(left))
    {
      pos.x -= 1;
      if(pos.x <= 0)
      {
        pos.x = width;
      }
    }    
    if (checkKey(right))
    {
      pos.x += 1;
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
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    // spaceshipp
    pushMatrix();


    
    stroke(colour);
    line(pos.x, pos.y, (pos.x + ship_size), pos.y - ship_size);
    line((pos.x + (ship_size *2)), pos.y, (pos.x + ship_size), pos.y - ship_size);
    line(pos.x, pos.y, pos.x + (ship_size * 2), pos.y);
    line(pos.x, pos.y, pos.x, (pos.y + ship_size));
    line(pos.x, (pos.y + ship_size), (pos.x + 20), pos.y);
    line((pos.x + 20), pos.y, pos.x + (ship_size * 2), (pos.y + 20));
    line((ship_size * 2) + pos.x, (pos.y + 20), pos.x + (ship_size * 2), pos.y);
    popMatrix();
    
  }  
}
