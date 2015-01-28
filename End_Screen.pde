 void end_screen()
 {
    String end_text = "End of Game";
    String score = "Your Score is: ";
    
    
    int temp = frameCount % 60;
    int temp2 = frameCount % 30;
    int y = 80;

    textSize(70);  
   
    if(temp == 0)
    {
      background(0);
      fill(#FC2929);
      text( end_text,(width / 4), y);
      
      textSize(40);
      text(score + score_in_game, (width / 5), 80 * 3);
    
      textSize(30);
      text("Press 'q' to Restart", (width / 5), 80 * 5);
      text("Press 'e' to return to main menu", (width / 5), y * 5.5);
    }
    else if(temp2 == 0)
    {
      background(#FC2929);
      fill(#030303);
      text( end_text,(width / 4), y); 

      textSize(40);
      text(score + score_in_game, (width / 5), 80 * 3);
    
      textSize(30);
      text("Press 'q' to Restart", (width / 5), 80 * 5);
      text("Press 'e' to return to main menu", (width / 5), 80 * 5.5); 
    }
 }

