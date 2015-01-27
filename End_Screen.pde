 void end_screen()
 {
    String end_text = "End of Game";
    String score = "Your Score is: ";
    
    
    int temp = frameCount % 60;
    int temp2 = frameCount % 30;

    textSize(50);  
   
    if(temp == 0)
    {
      background(0);
      fill(#FC2929);
      text( end_text,100, 50);
      
      textSize(25);
      text(score + score_in_game, 100, 225);
    
      textSize(20);
      text("Press 'q' to Restart", 100, 300);
      text("Press 'e' to return to main menu", 100, 350);
    }
    else if(temp2 == 0)
    {
      background(#FC2929);
      fill(#030303);
      text( end_text,100, 50); 

      textSize(25);
      text(score + score_in_game, 100, 225);
    
      textSize(20);
      text("Press 'q' to Restart", 100, 300);
      text("Press 'e' to return to main menu", 100, 350); 
    }
 }

