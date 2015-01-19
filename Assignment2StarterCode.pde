/* this is a test
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Bullets> bullet = new ArrayList<Bullets>();
boolean[] keys = new boolean[526];
boolean[] alive = new boolean[6];
boolean start_screen = true;

// Fleet variables
int number_enemy = 6;
int enemy_space = 0;
int Ypos = 30;
int num_rows = 3;
int total_enemys;

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  background = new Background[50];
  fleet = new Fleet[number_enemy];
  fleet2 = new Fleet[number_enemy];
  fleet1 = new Fleet[number_enemy];

    for(int i = 0; i < 50; i ++)
    {
      background[i] = new Background();
    }
    for(int i = 0; i < number_enemy; i ++)
    {
      fleet[i] = new Fleet(80, Ypos, enemy_space);
      enemy_space += 50;
    }
    
    enemy_space = 0;
    for(int i = 0; i < number_enemy; i ++)
    {
      fleet1[i] = new Fleet(80, 80, enemy_space);
      enemy_space += 50;
    }
    
    enemy_space = 0;
    for(int i = 0; i < number_enemy; i ++)
    {
      fleet2[i] = new Fleet(80, 130, enemy_space);
      enemy_space += 50;
    }
}

void draw()
{
  if(start_screen == false)
  {
    background(0);
    for(int i = 0; i < 50; i ++)
    {
      background[i].display();
    }
  
    for(Player player:players)
    {
      player.update();
      player.display();
    }
    for(int i = 0; i < number_enemy; i ++)
    {
      fleet[i].display();
      fleet1[i].display();
      fleet2[i].display();
      
      fleet[i].move();
      fleet1[i].move();
      fleet2[i].move();
       
    }
    
    for(int i = 0; i < bullet.size(); i ++)
    {
      bullet.get(i).display();
      bullet.get(i).move();
    }
    

  }
  else if(start_screen == true)
  {
    main_menu.display();
    main_menu.keyPressed();
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
