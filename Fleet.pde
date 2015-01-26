class Fleet extends Player
{
  float x, y, space, w,h;
  int speed = 0;
  boolean flag1 = true;
  boolean flag2 = false;
  boolean flag3 = false;
  
  
  Fleet(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.space = space;    
    this.w = w;
    this.h = h;
  }
  
  void display()
  {
     fill(#B0C6FC);
     stroke(#5D8CFF);
     ellipse(x ,y + speed,w,h);
     stroke(#5D8CFF);
     ellipse(x,y - 5 + speed , w - 25,h);
  }
  
  void move()
  {
    int total_num;
    total_num = 60 * number_enemy;

      if(x >= width)
      {
        flag1 = false;
        flag2 = true;
        flag3 = false;
        y += 25;
      }
     if(x <= 0)
     {
       flag1 = false;
       flag2 = false;
       flag3 = true;
       y += 25;
     }
      if(flag1 == true)
      {
        x += 1;
      }
      
      if(flag2 == true)
      {
        x-=1;
      }
      
      if(flag3 == true)
      {
        x += 1;
      }
    
  }  
}
 

