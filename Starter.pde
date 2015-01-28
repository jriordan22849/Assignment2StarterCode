// Start Screen
Starter main_menu = new Starter();
class Starter extends Player
{
  int x, y;
  
  void display()
  {
    int x = 225;
    // main menu screen
    background(0);
    
    fill(255);
    stroke(#002CFC);
    rect(width / 4, 40, 400, 310, 5);
    
    fill(#8C46FF);
    rect(width/ 3.8, 45, 380, 300,5);
    
    fill(#36A3FF);
    textSize(50);
    text("Space Invaders", (width / 3.6), 100);   

    
    // button pressed in order to start the game, the button will be "s"
    textSize(20);
    fill(0);
    text("Press 'q' or 'start' to start the game",x, 210);  
    text("Press 's' or 'button1' for instructions",x, 270);  
  
      
  }
}
