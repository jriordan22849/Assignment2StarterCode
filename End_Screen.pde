
 void end_screen()
 {
    String end_text = "End of Game";
    String score = "Your Score is: ";
    background(0);
    fill(#FF0000);
    // Displays Score in the top left hand conrer
    textSize(50);
    text( end_text,100, 50);
    
    textSize(25);
    text(score + score_in_game, 100, 200);
    
   text("Press 'r' to Restart", 100, 300);
   
 }

