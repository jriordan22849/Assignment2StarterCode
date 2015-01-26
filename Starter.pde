
// Start Screen
Starter main_menu = new Starter();
class Starter extends Player
{
  int x, y;
  
  void display()
  {
    // main menu screen
    background(#B9DFFF);
    
    fill(#36A3FF);
    textSize(50);
    text("Space Invaders", (width / 6), 100);   
   
    fill(255);
    rect(60, 150, 400, 175, 5); 
    
    // button pressed in order to start the game, the button will be "s"
    textSize(20);
    fill(0);
    text("Press 'q' or 'start' to start the game",80, 210);  
    text("Press 's' or 'button1' for instructions",80, 270);  
  
      
  }
}
