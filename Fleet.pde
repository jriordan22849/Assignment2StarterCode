Fleet fleet;
class Fleet extends Player
{
 float x, y;
  
 void display()
 {
   // x = 60
   // y = 30
   x = location.x;
   y = location.y;
   
   stroke(255);
   line(x, y, x + 20, y);
   line(x - 10, y + 20, x, y);
   line(x + 20, y, x + 30, y + 20);
   line(x - 10, y + 20, x + 30, y + 20);
   line(x - 10, y + 20, x - 10, y + 30);
   line(x + 30, y + 20, x + 30, y + 30);
   
 }
   
  
}
