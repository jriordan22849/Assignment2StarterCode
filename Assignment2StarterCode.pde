/*
Student ID: C13432152
Name: Jonathan Riordan
Object Orientated Programming Assignment

SPACE INVADERS
*/

// import music library
import ddf.minim.*;

Minim minim, m_fire_sound, player_fire_sound, hit_detection, player_hurt, explosion, power_up_sound;
AudioPlayer player, player2, player3, player4, player5, player6;

// set screen size either for laptop or gaming arcade machine depending on devmode

// Arraylist used for bullets, enemys, power up and the player.
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Bullets> bullet = new ArrayList<Bullets>();
ArrayList<Bullets> m_bullet = new ArrayList<Bullets>();
ArrayList<Fleet> fleet = new ArrayList<Fleet>();
ArrayList<Power_up> power_up = new ArrayList<Power_up>();
boolean[] keys = new boolean[526];

// different screens in game
boolean start_screen = true;
boolean game_screen  = false;
boolean end_screen = false;
boolean instructions = false;

// Fleet variables
int number_enemy = 6;
int enemy_space = 0;
int Ypos = 50;
int num_rows = 3;
int total_enemys;

int num_stars = 50;
// Player in game variables
int lives = 3;
int score_in_game = 0;

void setup()
{
  size(800, 600);

  
  minim = new Minim(this);
  m_fire_sound = new Minim(this);
  player_fire_sound = new Minim(this);
  hit_detection = new Minim(this);
  player_hurt = new Minim(this);
  explosion = new Minim(this);
  power_up_sound = new Minim(this);
  
  // background song played throughout the programe and is on a loop.
  player = minim.loadFile("Phutureprimitive - Kinetik.mp3");
  player.loop();
  
  // Player controls are set up
  setUpPlayerControllers();
  
  // the starts in the background, there is 50.
  background = new Background[num_stars];
  
  // mothership location a and y, width and height
  m_ship = new MotherShip(50, 40, 60, 30, true);

  for(int i = 0; i < num_stars; i ++)
  {
    background[i] = new Background();
  }
  
  // calls the create enemys function and create power up function
  create_enemys();
  create_power_ups();
}

void draw()
{
  // start screen
  if(start_screen == true)
  {
    // calls function main menu
    main_menu.display();
    
    // controls for the user in the start screen
    for(Player player_start_screen:players)
    {
      player_start_screen.update();
    }
  }
  
  // instruction screen 
  if(instructions == true)
  {
    instructions(); 
    
    // controls for the user in the start screen
    for(Player player_start_screen:players)
    {
      player_start_screen.update();
    }
  }
  
  // game screen
  if(game_screen == true)
  {
    background(0);
    barrier();
    
    // if lives is less or equal to 0, the game screen is turned off and the end screen is activated
    if(lives <= 0)
    {
      game_screen = false;
      end_screen = true;
    }
    
    // displays the stars
    for(int i = 0; i < num_stars; i ++)
    {
      background[i].display();
    }
    
    // mother ship methods
    m_ship.display();
    m_ship.move();
    m_ship.m_fire_display();
    
    // if  all of the ships in the enemy fleet is destroyed, a new fleet is created
    if(fleet.isEmpty())
    {
      create_enemys();
    }
   
    // fleet methods
    for(int i = 0; i < fleet.size(); i ++)
    {
      fleet.get(i).display();
      fleet.get(i).move();
    }
    
    // power ups method
    for(int i = 0; i < power_up.size(); i ++)
    {
      power_up.get(i).display();
      power_up.get(i).move();
      power_up.get(i).power_up_hit_detection();
    }
    
    // player methods
    for(Player player:players)
    {
      player.hit_detection();
      player.m_ship_hit_detection();
      player.fleet_hit_detection();
      player.update();
      player.display();
    }
    
    // bullet methods
    for(int i = 0; i < bullet.size(); i ++)
    {
      bullet.get(i).display();
      bullet.get(i).move();
    }
        
    // mother ship bullets methods 
    for(int i = 0; i < m_bullet.size(); i ++)
    {
      m_bullet.get(i).display_enemy_bullet();
      m_bullet.get(i).enemy_move();
    }
    
    
    // Displays the score and lives of the player in the top left hand corner of the screen
    fill(#FF0000);
    // Displays Score in the top left hand conrer
    textSize(20);
    text("Lives: " + lives, 10, 30);
    text("Score: " + score_in_game, 10, 60);
   
  }
  
  // end screen
  if(end_screen == true)
  {
    // removes enemy fleet from the arraylist.
    for(int i = 0; i < fleet.size(); i ++)
    {
      fleet.remove(i); 
    }

    // removes power ups from the array list
    for(int i = 0; i < power_up.size(); i ++)
    {
      power_up.remove(i);
    }
    
    
    end_screen();
    
    // controls for the user in the end screen
    for(Player player_start_screen:players)
    {
      player_start_screen.update();
    }
  }
}

// function to create a power up which gives the user an extra lfe. the x position is random and the y position is random aswell,
void create_power_ups()
{
  float x = random(0, width);
  float y = random(-1000, -500);
  float size = 20;
  int number_power_ups = 1;
  
  for(int i = 0; i < number_power_ups; i ++)
  {
    power_up.add(new Power_up(x, y, size));
  }
}

// Funcion to create the enemys 
  void create_enemys()
 {
  float x = 5;
  float y = 80;
  float w = 40;
  float h = 15;
  int distance = 0;
  float row = 0;
  int num_rows = 4;
  int ships_per_row = 8; 

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

// finction to create a barrier and display it
void barrier()
{
 int x = 0;
 int y = (height - 50);
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
     player5 = player_hurt.loadFile("Hit_Hurt17.wav");
     player5.play();
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
    
    // player x and y position
    p.pos.x = x;
    p.pos.y = height - 25;
    players.add(p);         
  }
}

// function to display instructions to the user 
void instructions()
{
  background(0);  
  textSize(30);
  fill(#FF121A);
  text("Rules", width / 2.5, 50);
  textSize(20);
  text("- Player has 3 lives.", 25, 100);
  text("- Dodge Mothership bullets to survive.", 25, 125);
  text("- Destroy enemy fleet before they cross the line.", 25, 150);
  text("- Collect the yellow circles to gain an extra life.", 25, 175);
  
  textSize(30);
  text("Controls", width / 2.5, 225);
  
  textSize(20);
  text("- 'w' to move up", 25, 275);
  text("- 'a' to move left", 25, 300);
  text("- 'd' to move right", 25, 325);
  text("- 's' to move down", 25, 350);
  text("- 'e' to fire", 25, 375);
  
  text("'r' to return to main menu", 25, 450);
}

