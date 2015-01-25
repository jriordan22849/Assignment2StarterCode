/* this is a test
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Bullets> bullet = new ArrayList<Bullets>();
ArrayList<Bullets> m_bullet = new ArrayList<Bullets>();
ArrayList<Fleet> fleet = new ArrayList<Fleet>();
boolean[] keys = new boolean[526];

// different screens in game
boolean start_screen = false;
boolean game_screen  = true;
boolean end_screen = false;

// Fleet variables
int number_enemy = 6;
int enemy_space = 0;
int Ypos = 50;
int num_rows = 3;
int total_enemys;

// Player in game variables
int lives = 3;
int score_in_game = 0;

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  background = new Background[50];
  m_ship = new MotherShip(50, 40, 60, 30, true);

  for(int i = 0; i < 50; i ++)
  {
    background[i] = new Background();
  }
  
  create_enemys();
}

void draw()
{
  if(start_screen == true)
  {
    main_menu.display();
    main_menu.start_game();
  }
  if(game_screen == true)
  {
    background(0);
    barrier();
    if(lives == 0)
    {
      end_screen = true;
    }
    
    for(int i = 0; i < 50; i ++)
    {
      background[i].display();
    }
    
    m_ship.display();
    m_ship.move();
    m_ship.m_fire_display();
    
    if(fleet.isEmpty())
    {
      create_enemys();
    }
 
    for(int i = 0; i < fleet.size(); i ++)
    {
      fleet.get(i).display();
      fleet.get(i).move();
    }
    
    
    for(Player player:players)
    {
      player.hit_detection();
      player.m_ship_hit_detection();
      player.fleet_hit_detection();
      player.update();
      player.display();
    }
    
    
    for(int i = 0; i < bullet.size(); i ++)
    {
      bullet.get(i).display();
      bullet.get(i).move();
    }
        
        
    for(int i = 0; i < m_bullet.size(); i ++)
    {
      m_bullet.get(i).display_enemy_bullet();
      m_bullet.get(i).enemy_move();
    }
    
    
    fill(#FF0000);
    // Displays Score in the top left hand conrer
    textSize(20);
    text("Lives: " + lives, 10, 30);
    text("Score: " + score_in_game, 10, 60);
   
   
    if(end_screen == true)
    {
      end_screen();
    }
  }
}

  void create_enemys()
 {
  float x = 125;
  float y = 60;
  float w = 40;
  float h = 15;
  int distance = 0;
  float row = 0;
  int num_rows = 3;
  int ships_per_row = 5; 

  for(int i = 0; i <= num_rows; i ++)
  {
     for(int j = 0; j < ships_per_row; j ++)
    {
       fleet.add(new Fleet(x + distance, y + row, w, h));
       distance += 60;
    }
    distance = 0;
    row += 50;
  }

}

void barrier()
{
 int x = 0;
 int y = 450;
 int spacing = 0;
 int size = 5;
 
 for(int i = 0; i < width; i ++)
 {
  stroke(#FF767B);
  line(x + spacing, y - 50, x + spacing + size, y - 50);
  line(x + spacing, y - 40, x + spacing + size, y - 40);
  spacing += 10; 
 }
 
 for(int i = 0; i < fleet.size(); i ++)
 {
   Fleet temp_fleet = fleet.get(i);
   if(temp_fleet.y >= y - 50)
   {
     fleet.remove(i);
     background(#FF0000);
     lives--;
   }
 } 
}








void keyPressed()
{
  keys[keyCode] = true;
}


void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}


void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(i, color(255), playerXML);
    int x = (i + 1) * gap;
    // x = 250 at begining so is y
    p.pos.x = x;
    p.pos.y = 450;
    players.add(p);         
  }
}
