
// Start Screen
Starter main_menu = new Starter();
class Starter extends Player
{
  int x, y;
  
  void display()
  {
    // main menu screen
    background(0);
    
    fill(255);
    textSize(50);
    text("Space Invaders", (width / 6), 100);    
    
    // begin box
    fill(#FF9D9D);
    rect( (width / 4), (height / 2), 225, 50);
    // text for box
    fill(0);
    textSize(30);
    text("Start Game", (width / 3.3), 285);
    
    // button pressed in order to start the game, the button will be "s"
    textSize(15);
    fill(255);
    text("Press 's' in order to start the game",125, 450);    
  }
  void keyPressed()
  {
    if(key == 's' || key == 'S')
    {
      start_screen = false;
    }
  }
  
}
