
class Fleet extends Player
{
  float x, y, space;
  
  Fleet(float x, float y, float space)
  {
    this.x = x;
    this.y = y;
    this.space = space;    
  }
  
  void display()
  {
     fill(#FF0000);
     ellipse(x,y,space,space); 
  }
   
}
 

