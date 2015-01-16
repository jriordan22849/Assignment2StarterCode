class Spaceinvader extends Player
{
 int rows = 3; 
 int cols = 8;
 boolean positionFlag;
 int enemyX;
 int enemyY;
 int type = 0;
 
 ArrayList<Fleet> invaders; 
 
 Spaceinvader()
 {
    enemyX = width / 10 + 35;
    enemyY = height / 10 + 70;
    invaders = new ArrayList<Fleet>();
    
 }

  
}

