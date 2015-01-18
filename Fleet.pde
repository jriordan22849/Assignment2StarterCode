Fleet fleet;
class Fleet extends Player
{
  int num_enemys = 6;
  float x, y;
  boolean flag1= true;
  boolean flag2, flag3 = false;
  int x1 = 0;
  int num_enemy;
  int total_size; 
  int enemy_space = 50;
  
  Fleet(float x, float y, int x1, int num_enemy)
  {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.num_enemy = num_enemy;
  }
  

  
   void display()
   {
      int x1 = 0;
      for( int i = 0; i < num_enemy; i ++)
      {
        stroke(255);
        line(x + x1, y, x + x1 + 20, y);
        line(x + x1 - 10, y + 20, x + x1, y);
        line(x + x1 + 20, y, x + x1 + 30, y + 20);
        line(x + x1 - 10, y + 20, x + x1 + 30, y + 20);
        line(x + x1 - 10, y + 20, x + x1 - 10, y + 30);
        line(x + x1 + 30, y + 20, x + x1 + 30, y + 30);
        x1 += 50;
      }
   }
 
   void move()
   {
     total_size = num_enemy * 50;
      
    
     if( (x + total_size) >= 500)
     {
       flag1 = false;
       flag2 = true;
       flag3 = false;
       y += 20;
     }
     
     if(x <= 0)
     {
       flag1 = false;
       flag2 = false;
       flag3 = true;
       y += 5;
     }
     
     if(flag1 == true)
     {
       x += 1;
     }
     
     if(flag2 == true)
     {
       x -= 1;
     }
     
     if(flag3 == true)
     {
       x += 1;
     }
     
     
  
  
   }
 
}
 
